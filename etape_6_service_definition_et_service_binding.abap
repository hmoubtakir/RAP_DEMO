1- Service Definition, à partir de la view entity ZI_ELEVE_#### choisir create Service Definition

//-----------------------------------------------------
@EndUserText.label: 'Service Definition for Eleve'
define service ZUI_ELEVE_#### {
  expose ZI_ELEVE_#### as Eleve;
  expose ZI_NOTE_#### as Note;
  expose ZI_MATIERE_#### as Matiere;
}
