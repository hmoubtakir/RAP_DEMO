@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Entity for eleves'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZI_ELEVE_#### as select from zzt_eleve_#### 
association [1..*] to ZI_NOTE_#### as _Note
on $projection.Matricule = _Note.Matricule

{
    key matricule as Matricule,
    @EndUserText.label: 'Nom'
    nom as Nom,
    @EndUserText.label: 'Prénom'
    prenom as Prenom,
    @EndUserText.label: 'Adresse e-mail'
    email as Email,
    @EndUserText.label: 'Date d''entrée'
    date_entree as DateEntree,
    actif as Actif,
    _Note
}

//---------------------------------------------------------------

@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Entity for employee'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZI_ELEVE_#### as select from zzt_eleve_#### 
association [1..*] to ZI_NOTE_#### as _Note
on $projection.Matricule = _Note.Matricule

{
    key matricule as Matricule,
    @EndUserText.label: 'Nom'
    nom as Nom,
    @EndUserText.label: 'Prénom'
    prenom as Prenom,
    @EndUserText.label: 'Adresse e-mail'
    email as Email,
    @EndUserText.label: 'Date d''entrée'
    date_entree as DateEntree,
    actif as Actif,
    _Note
}
