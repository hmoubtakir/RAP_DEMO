1- Service Definition, à partir de la view entity ZI_ELEVE_0001 choisir create Service Definition

//-----------------------------------------------------
@EndUserText.label: 'Service Definition for Eleve'
define service ZUI_ELEVE_0001 {
  expose ZI_ELEVE_0001 as Eleve;
  expose ZI_NOTE_0001 as Note;
  expose ZI_MATIERE_0001 as Matiere;
}