CLASS zcl_data_generator_0001 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_data_generator_0001 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA : lt_mat  TYPE TABLE OF zzt_matiere_0001,
           lt_emp  TYPE TABLE OF zzt_eleve_0001,
           lt_note TYPE TABLE OF zzt_note_0001.

    DELETE FROM : zzt_matiere_0001, zzt_eleve_0001, zzt_note_0001.

    APPEND VALUE #(  matiere   = 'FRAN'
      libelle_court =   'Français'
      libelle_long  =   'Langue Française'
      )
        TO lt_mat.

    APPEND VALUE #(  matiere   = 'MATH'
      libelle_court =   'Maths'
      libelle_long  =   'Mathématiques'
      )
        TO lt_mat.

    APPEND VALUE #(
                    matricule = '0001'
                    nom = 'MOUBTAKIR'
                    prenom = 'Hassan'
                    email = 'hassan.moubtakir@rte-france.com'
                    date_entree = '20220304'
                    actif = abap_true
                    )
                    TO lt_emp.

    APPEND VALUE #(
                    matricule = '0002'
                    nom = 'ELABAIDLA'
                    prenom = 'MAELAYNINE'
                    email = 'elabadila.maaelaynine@rte-france.com'
                    date_entree = '20210101'
                    actif = abap_true
                    )
                    TO lt_emp.

    APPEND VALUE #(
                  matricule = '0001'
                  matiere = 'FRAN'
                  date_note = '20220101'
                  note = 19
                )
                TO lt_note.

    APPEND VALUE #(
                  matricule = '0001'
                  matiere = 'MATH'
                  date_note = '20220101'
                  note = 13
                )
                TO lt_note.

    APPEND VALUE #(
                  matricule = '0002'
                  matiere = 'FRAN'
                  date_note = '20220101'
                  note = 15
                )
                TO lt_note.

    APPEND VALUE #(
                  matricule = '0002'
                  matiere = 'MATH'
                  date_note = '20220101'
                  note = 15
                )
                TO lt_note.

    INSERT zzt_matiere_0001 FROM TABLE @lt_mat.
    INSERT zzt_eleve_0001 FROM TABLE @lt_emp.
    INSERT zzt_note_0001 FROM TABLE @lt_note.

    out->write( 'Génération des données terminée avec succès' ).

  ENDMETHOD.

ENDCLASS.