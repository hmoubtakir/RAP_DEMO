1-Metadata Extension pour ZI_ELEVE_####

//----------------------------------------------------

@Metadata.layer: #CORE
@UI: {
  headerInfo: { typeName: 'Elève',
                typeNamePlural: 'Elèves',
        title: { type: #STANDARD, value: 'Matricule' },
        description: { value: 'Nom' }                
    }
  }
annotate view ZI_ELEVE_####
    with 
{
@UI.facet: [ { id:              'eleve',
                 purpose:         #STANDARD,
                 type:            #IDENTIFICATION_REFERENCE,
                 label:           'Fiche élève',
                 position:        10 } ,
              { id:              'Notes',
                 purpose:         #STANDARD,
                 type:            #LINEITEM_REFERENCE,
                 label:           'Notes',
                 position:        20,
                 targetElement:   '_Note'} ]                
    @UI.selectionField: [{ position: 10 }]
    @UI.lineItem: [{ position: 10, label: 'Matricule' }]
    @UI.identification: [{ position: 10, label: 'Matricule' }]
    Matricule;
    @UI.selectionField: [{ position: 20 }]
    @UI.lineItem: [{ position: 20, label: 'Nom' }]
    @UI.identification: [{ position: 20, label: 'Nom' }]    
    Nom;
    @UI.lineItem: [{ position: 30, label: 'Prénom' }]
    @UI.identification: [{ position: 30, label: 'Prénom' }]    
    Prenom;    
    @UI.selectionField: [{ position: 40 }]
    @UI.lineItem: [{ position: 40, label: 'Email' }]
    @UI.identification: [{ position: 40, label: 'Email' }]
    Email;
    @UI.selectionField: [{ position: 50 }]
    @UI.lineItem: [{ position: 50, label: 'Date entrée' }]
    @UI.identification: [{ position: 50, label: 'Date entrée' }]
    DateEntree;
    @UI.selectionField: [{ position: 60 }]
    @UI.lineItem: [{ position: 60, label: 'Actif ?' }]
    @UI.identification: [{ position: 50, label: 'Actif ?' }]
    Actif;
}

2-Metadata Extension pour ZI_NOTE_####

//----------------------------------------------------

@Metadata.layer: #CORE
annotate view ZI_NOTE_####
    with 
{
    @UI.lineItem: [{ position: 10, label: 'Matière' }]
    Matiere;
    @UI.lineItem: [{ position: 20, label: 'Date Note' }]
    DateNote;
    @UI.lineItem: [{ position: 30, label: 'Note/20' }]
    Note;
    
}