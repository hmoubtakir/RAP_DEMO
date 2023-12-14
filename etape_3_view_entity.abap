3.1 Création des "view Entity" pour chacne de nos tables
    Action : Clic droit sur la table concernée et choisir "New Data Definion" et dans la dernière étape de l'assistant choisir "DEFINE VIEW ENTITY"
//---------------------------------------------------------------

@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View Entity for Matiere'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_MATIERE_#### as select from zzt_matiere_#### {
    key matiere as Matiere,
    libelle_court as LibelleCourt,
    libelle_long as LibelleLong
}

//---------------------------------------------------------------

@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View Entity for Note'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity ZI_NOTE_#### as select from zzt_note_####
association [0..1] to ZI_MATIERE_#### as _Matiere
on $projection.Matiere = _Matiere.Matiere {
    key matricule as Matricule,    
    @ObjectModel.text.element: ['MatiereText']
    @ObjectModel.text.control: #ASSOCIATED_TEXT_UI_HIDDEN
    key matiere as Matiere,
    _Matiere.LibelleCourt as MatiereText,
    date_note as DateNote,
    note as Note,
    _Matiere
}

//---------------------------------------------------------------

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View Entity for Eleve'
@Metadata.allowExtensions: true
define root view entity ZI_ELEVE_#### as select from zzt_eleve_#### 
association [0..*] to ZI_NOTE_#### as _Note 
on $projection.Matricule = _Note.Matricule
{
    key matricule as Matricule,
    nom as Nom,
    prenom as Prenom,
    email as Email,
    date_entree as DateEntree,
    actif as Actif,
    _Note
}

3.2 Création d'une "Project view" pour la view ZI_ELEVE_####
Clic droit sur la "view entity" et choisir "New Data Definion" et dans la dernière étape de l'assistant (choix du type de l'entité choisir "Projection VIEW"

@EndUserText.label: 'Projection view for Eleve'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZC_ELEVE_####
provider contract transactional_query
as projection on ZI_ELEVE_####
{
    key Matricule,
    Nom,
    Prenom,
    Email,
    DateEntree,
    Actif,
    /* Associations */
    _Note
}
