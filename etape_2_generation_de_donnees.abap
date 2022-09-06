CLASS zcl_data_generator_#### DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_data_generator_#### IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA : lt_mat  TYPE TABLE OF zzt_matiere_####,
           lt_emp  TYPE TABLE OF zzt_eleve_####,
           lt_note TYPE TABLE OF zzt_note_####.

    DELETE FROM : zzt_matiere_####, zzt_eleve_####, zzt_note_####.

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
                    nom = 'ELABADILA'
                    prenom = 'MAAELAYNINE'
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

    INSERT zzt_matiere_#### FROM TABLE @lt_mat.
    INSERT zzt_eleve_#### FROM TABLE @lt_emp.
    INSERT zzt_note_#### FROM TABLE @lt_note.

    out->write( 'Génération des données terminée avec succès' ).

  ENDMETHOD.

ENDCLASS.