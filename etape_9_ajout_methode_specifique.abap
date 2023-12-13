"
"---Ajout d'une action spécifique pour activer un objet "Eleve" ou le désactiver
"

"1. Rendre le champ "Actif" non modifiable
"Modifier l'objet "Behaviour definition" ZI_ELEVE_####

...
etag master locallastchangedat
{
  create;
  update;
  delete;
  field ( readonly ) Actif;
  
"2.  Ajouter un bouton "Activer" / "Désactiver" au niveau de l'UI (à l'aide des annotations)
	"Metadata Extensions" ZI_ELEVE_####
	
	...
	
  @UI.lineItem: [{ position: 60, label: 'Actif ?' },
                 { type:#FOR_ACTION, dataAction: 'setActif', label: 'Enable'  }]
  @UI.identification: [{ position: 50, label: 'Actif ?' },
                       { type:#FOR_ACTION, dataAction: 'setActif', label: 'Enable'  }]
  Actif;
}

"3. Ajouter l'action setActif et implémenter son code :
"-- 3.1 Modifier l'objet "Behaviour definition" ZI_ELEVE_####
...
{
  create;
  update;
  delete;
  field ( readonly ) Actif;
  action (features : instance ) setActif result [1] $self;
  
"-- 3.2 Implémenter le code de la méthode "setActif"
CLASS lhc_ZI_ELEVE_#### DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Eleve RESULT result.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Eleve RESULT result.
    METHODS setActif FOR MODIFY
      IMPORTING keys FOR ACTION Eleve~setActif RESULT result.

ENDCLASS.
...
 METHOD setActif.
  " Modifier Le champ Actif pour les entités passés dans keys
  MODIFY ENTITIES OF ZI_ELEVE_#### IN LOCAL MODE
    ENTITY Eleve
    UPDATE
    FIELDS ( Actif )
    WITH VALUE #(  FOR key IN Keys ( %tky = key-%tky Actif = abap_true ) )
    FAILED failed
    REPORTED reported.

   " Lire la réponse à partir de l'objet modifié
   READ  ENTITIES OF ZI_ELEVE_#### IN LOCAL MODE
   ENTITY Eleve
   ALL FIELDS WITH CORRESPONDING #(  keys )
   RESULT DATA(elevedata).

   result = VALUE #( FOR record in elevedata
    ( %tky = record-%tky %param = record )
    ).
  ENDMETHOD.

ENDCLASS.
