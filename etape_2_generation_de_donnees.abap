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
           lt_ele  TYPE TABLE OF zzt_eleve_####,
           lt_note TYPE TABLE OF zzt_note_####.

"---- Suppression des données existantes

    DELETE FROM : zzt_matiere_####, zzt_eleve_####, zzt_note_####.

"---- Insertion des matières

    APPEND VALUE #(  matiere   = '0001'
      libelle_court =   'Chimie'
      libelle_long  =   'Cours de Chimie'
      )
        TO lt_mat.

    APPEND VALUE #(  matiere   = '0002'
      libelle_court =   'Mathématiques'
      libelle_long  =   'Cours de Mathématiques'
      )
        TO lt_mat.

    APPEND VALUE #(  matiere   = '0003'
      libelle_court =   'Composition'
      libelle_long  =   'Cours de Composition'
      )
        TO lt_mat.

    APPEND VALUE #(  matiere   = '0004'
      libelle_court =   'Litérature'
      libelle_long  =   'Cours de Litérature'
      )
        TO lt_mat.

    APPEND VALUE #(  matiere   = '0005'
      libelle_court =   'Economie'
      libelle_long  =   'Cours d''économie'
      )
        TO lt_mat.

"---- Insertion des élèves

    APPEND VALUE #(
                    matricule = '0001'
                    nom = 'Norman'
                    prenom = 'Laura'
                    email = 'laura.norman@outlook.com'
                    date_entree = '20220304'
                    actif = abap_true
                    )
                    TO lt_ele.

    APPEND VALUE #(
                    matricule = '0002'
                    nom = 'Fakhouri'
                    prenom = 'Fadi'
                    email = 'fadi.fakhouri@gmail.com'
                    date_entree = '20210101'
                    actif = abap_true
                    )
                    TO lt_ele.

    APPEND VALUE #(
                    matricule = '0003'
                    nom = 'White'
                    prenom = 'Anthony'
                    email = 'anthony.white@gmail.com'
                    date_entree = '20210101'
                    actif = abap_true
                    )
                    TO lt_ele.
    APPEND VALUE #(
                    matricule = '0004'
                    nom = 'Li'
                    prenom = 'Yan'
                    email = 'yan.li@gmail.com'
                    date_entree = '20210101'
                    actif = abap_true
                    )
                    TO lt_ele.

    APPEND VALUE #(
                    matricule = '0005'
                    nom = 'Serrano'
                    prenom = 'Alicia'
                    email = 'alicia.serrano@gmail.com'
                    date_entree = '20210101'
                    actif = abap_false
                    )
                    TO lt_ele.
    APPEND VALUE #(
                    matricule = '0006'
                    nom = 'Carson'
                    prenom = 'Alexander'
                    email = 'alexander.carson@gmail.com'
                    date_entree = '20210101'
                    actif = abap_false
                    )
                    TO lt_ele.
"---- Insertion des notes
    APPEND VALUE #(
                  matricule = '0001'
                  matiere = '0002'
                  date_note = '20220101'
                  note = 19
                )
                TO lt_note.

    APPEND VALUE #(
                  matricule = '0001'
                  matiere = '0005'
                  date_note = '20220101'
                  note = 13
                )
                TO lt_note.

    APPEND VALUE #(
                  matricule = '0002'
                  matiere = '0002'
                  date_note = '20220101'
                  note = 15
                )
                TO lt_note.

    APPEND VALUE #(
                  matricule = '0002'
                  matiere = '0005'
                  date_note = '20220101'
                  note = 15
                )
                TO lt_note.

    APPEND VALUE #(
                  matricule = '0003'
                  matiere = '0002'
                  date_note = '20220101'
                  note = 15
                )
                TO lt_note.

    APPEND VALUE #(
                  matricule = '0003'
                  matiere = '0005'
                  date_note = '20220101'
                  note = 15
                )
                TO lt_note.
    APPEND VALUE #(
                  matricule = '0004'
                  matiere = '0002'
                  date_note = '20220101'
                  note = 11
                )
                TO lt_note.

    APPEND VALUE #(
                  matricule = '0004'
                  matiere = '0005'
                  date_note = '20220101'
                  note = 12
                )
                TO lt_note.

    INSERT zzt_matiere_#### FROM TABLE @lt_mat.
    INSERT zzt_eleve_#### FROM TABLE @lt_ele.
    INSERT zzt_note_#### FROM TABLE @lt_note.

    COMMIT WORK.
    out->write( 'Génération des données terminée avec succès (groupe ####)' ).
  ENDMETHOD.

ENDCLASS.
