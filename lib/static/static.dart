import 'package:cin_hub/model/acteur.dart';
import 'package:cin_hub/model/movie.dart';

import '../model/film.dart';

List<Film> listFilm = [
  Film(
    id: 1,
    name: "Fight club",
    description: "fight club",
    catagory: "action",
    nbStar: 6,
    image: "assets/images/film/fightClub.jpg",
  ),
  Film(
    id: 2,
    name: "Scar face",
    description: "scar face",
    catagory: "action",
    nbStar: 6,
    image: "assets/images/film/Scarface.jpg",
  ),
  Film(
    id: 3,
    name: "Inseption",
    description: "inseption",
    catagory: "action",
    nbStar: 6,
    image: "assets/images/film/inseption.jpg",
  ),
  Film(
    id: 4,
    name: "Interstellar",
    description: "interstellar",
    catagory: "action",
    nbStar: 6,
    image: "assets/images/film/interstellar.jpg",
  ),
  Film(
    id: 5,
    name: "Black mirror",
    description: "black mirror",
    catagory: "action",
    nbStar: 6,
    image: "assets/images/film/blackMirror.png",
  ),
];

List<Movie> movieList = [
  Movie(
    id: 1,
    name: "fast and furious",
    description:
        "Dom Toretto rassemble son équipe pour démanteler un complot à échelle mondiale mené par le tueur le plus implacable qu'ils aient jamais affronté, aussi redoutable avec une arme que derrière un volant : un homme qui n'est autre que le frère désavoué de Dom, Jakob.",
    image: "assets/images/movie/fate_of_the_furious.jpg",
    etat: false,
    catagory: "Action",
    nbStar: 6,
    nbPerson: 15,
    listActeur: [
      Acteur(
        name: "Vin Diesel",
        role: "Dominic Toretto",
        image: "assets/images/actor/Vin-Diesel.jpg",
      ),
      Acteur(
        name: "Michelle Rodriguez",
        role: "Letty Ortiz",
        image: "assets/images/actor/LettyOrtiz.jpg",
      ),
      Acteur(
        name: "Dwayne Johnson",
        role: "Luke Hobbs",
        image: "assets/images/actor/lukehobss.jpg",
      ),
    ],
  ),
];
