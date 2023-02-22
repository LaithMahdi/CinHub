import 'package:cin_hub/model/acteur.dart';

class Movie {
  int id;
  String name;
  String description;
  String image;
  String catagory;
  bool etat;
  int nbStar;
  int nbPerson;
  List<Acteur> listActeur = [];
  Movie({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.catagory,
    required this.etat,
    required this.nbStar,
    required this.nbPerson,
    required this.listActeur,
  });
}
