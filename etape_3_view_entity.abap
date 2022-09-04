@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Entity for employee'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZI_EMP_#### as select from zzt_emp_#### 
association [1..*] to ZI_NOTES_#### as _Notes
on $projection.Matricule = _Notes.Matricule

{
    key matricule as Matricule,
    @EndUserText.label: 'Nom'
    nom as Nom,
    @EndUserText.label: 'Prénom'
    prenom as Prenom,
    @EndUserText.label: 'Adresse e-mail'
    email as Email,
    @EndUserText.label: 'Date d''embauche'
    date_embauche as DateEmbauche,
    actif as Actif,
    _Notes
}

//---------------------------------------------------------------

@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Entity for notes'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

define view entity ZI_NOTES_#### as select from zzt_notes_#### {    
    key matricule as Matricule,
    @EndUserText.label: 'Matière'
    key matiere as Matiere,
    @EndUserText.label: 'Date de la note'
    date_note as DateNote,
    note as Note
}
