Activation de l'option "etag" pour gérer les accés concurrents

1. Ajouter un champ de type timestampl à la table ZZT_ELEVE_####

define table zzt_eleve_#### {
	...
  locallastchangedat : timestampl;

}
Activer la table après modification

2. Ajout du champ à la "view Enity" avec l'annotation : localInstanceLastChangedAt
...
define root view entity ZI_ELEVE_#### as select from zzt_eleve_####
association [0..*] to ZI_NOTE_#### as _Note
on $projection.Matricule = _Note.Matricule
{
	...
    actif as Actif,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    locallastchangedat as locallastchangedat,
    _Note
}	

3. Ajout du champ à la "Projection view"
...
define root view entity ZC_ELEVE_####
provider contract transactional_query
as projection on ZI_ELEVE_####
{
	...
	Actif,
    locallastchangedat,
    /* Associations */
    _Note
}

4. Modifier L'objet "Behavior Definition" pour ajouter le champ etag

define behavior for ZI_ELEVE_####
...
authorization master ( instance )
etag master locallastchangedat
....
mapping for ZZT_ELEVE_9999
  {
    ...
    Actif = actif;
    locallastchangedat = locallastchangedat;
  }
}

5. Ajouter le champ locallastchangedat au "behavior definition" de la "Projection view" ZC_ELEVE_####
...
define behavior for ZC_ELEVE_####
use etag

6. Recréer le service Binding
