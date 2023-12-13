"
"---Activation de l'option "draft" pour éviter les pertes des modifications des données
"

"1. Activer l'option "with draft" au niveau de la "Behavior Definition"

managed implementation in class zbp_i_eleve_#### unique;
//strict;
with draft;

define behavior for ZI_ELEVE_#### //alias <alias_name>
persistent table ZZT_ELEVE_####
draft table zdr_eleve_####
lock master total etag locallastchangedat
authorization master ( instance )
etag master locallastchangedat
{
  create;
  update;
  delete;

 mapping for ZZT_ELEVE_####
  {
    Matricule = matricule;
    Nom = nom;
    Prenom = prenom;
    DateEntree = date_entree;
    Email = email;
    Actif = actif;
    locallastchangedat = locallastchangedat;
  }
}

"Faire de même pour l'objet ZC_ELEVE_#### (Behavior Definition)

projection;
//strict; //Comment this line in to enable strict mode. The strict mode is prerequisite to be future proof regarding syntax and to be able to release your BO.
use draft;

define behavior for ZC_ELEVE_#### //alias <alias_name>
use etag
{
  use create;
  use update;
  use delete;
}
"
"----2. Adapter la classe lhc_ZI_ELEVE_#### avec la méthode "get_instance_features"
"
CLASS lhc_ZI_ELEVE_#### DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_eleve_#### RESULT result.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR zi_eleve_#### RESULT result.

ENDCLASS.

CLASS lhc_ZI_ELEVE_#### IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_instance_features.
  ENDMETHOD.

ENDCLASS.
