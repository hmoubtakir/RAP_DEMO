1- Service Definition, à partir de la "Projection view" ZC_ELEVE_#### choisir create Service Definition

//-----------------------------------------------------
@EndUserText.label: 'Service Definition for Eleve'
define service ZUI_ELEVE_#### {
  expose ZC_ELEVE_#### as Eleve;
  expose ZI_NOTE_#### as Note;
  expose ZI_MATIERE_#### as Matiere;
}
2- Service Definition, à partir du service definition créé ( ZUI_ELEVE_#### ) choisir create Service Binding
//-----------------------------------------------------

2.1 Choisir un nom et une description pour notre objet service binding ainsi que le Binding type :
  Ex. Nom : ZUI_ELEVE_####
      Description  : Service Binding O2 for Eleve
      Binding Type : OData V2 - UI
2.2 Activer puis publier le service créé
2.3 Tester le service binding avec le bouton "Preview"
