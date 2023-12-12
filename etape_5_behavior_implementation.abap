managed implementation in class zbp_i_eleve_#### unique;
strict;

define behavior for ZI_ELEVE_#### //alias <alias_name>
persistent table zzt_eleve_####
lock master
authorization master ( instance )
//etag master <field_name>
{
  create;
  update;
  delete;

  mapping for ZZT_ELEVE_####
  {
    Matricule = matricule;
    Nom = nom;
    Prenom = prenom;
    DateEntree = date_entree;
    Email = email;
    Actif = actif;
  }
}
