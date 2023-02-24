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
    name: "Fast and furious",
    description:
        "Dom Toretto rassemble son équipe pour démanteler un complot à échelle mondiale mené par le tueur le plus implacable qu'ils aient jamais affronté, aussi redoutable avec une arme que derrière un volant : un homme qui n'est autre que le frère désavoué de Dom, Jakob.",
    image: "assets/images/movie/fate_of_the_furious.jpg",
    etat: false,
    catagory: "Action",
    nbStar: 6,
    nbPerson: 20,
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
  Movie(
    id: 2,
    name: "Sabak El khir",
    description:
        "Behi et Yasser se rencontrent en prison suite à des mésaventures.Ils font la connaissance d'un sorcier qui leur offre une boussole magique, qui permet de retracer un grand trésor.Ils décident tout les deux de se lancer dans la recherche de la carte qui va les guider au trésor, l'aventure commence en crescendo et aboutie à des situationsdrôles et comiques.",
    image: "assets/images/movie/Sabak El khir.jpg",
    etat: false,
    catagory: "Comedy",
    nbStar: 3,
    nbPerson: 5,
    listActeur: [
      Acteur(
        name: "Kamel Touati",
        role: "Kamel",
        image: "assets/images/actor/Kamel Touati.jpg",
      ),
      Acteur(
        name: "Karim Gharbi",
        role: "Behi",
        image: "assets/images/actor/Karim Gharbi.jpg",
      ),
      Acteur(
        name: "Lotfi Abdelli",
        role: "Yasser",
        image: "assets/images/actor/Lotfi Abdelli.jpg",
      ),
    ],
  ),
  Movie(
    id: 3,
    name: "DACHRA",
    description:
        "Yasmine, étudiante en journalisme, et ses amis Walid et Bilal, enquêtent sur un cas non résolu, une femme retrouvée à demi égorgée il y a 25 ans. Mongia est détenue dans un hôpital psychiatrique et soupçonnée de pratiquer la magie noire et la sorcellerie. Leur enquête les mène à Dachra, un village ancien et isolé dans les montagnes tunisiennes. Alors que le chef du village les invite à rester passer la nuit, Yasmine se retrouve mêlée aux lourds secrets de Dachra et n'a d'autre choix que de se battre pour sa survie.",
    image: "assets/images/movie/DACHRA.jpg",
    etat: false,
    catagory: "Horreur",
    nbStar: 6,
    nbPerson: 10,
    listActeur: [
      Acteur(
        name: "Yasmine Dimassi",
        role: "Yasmine",
        image: "assets/images/actor/Yasmine Dimassi.jpg",
      ),
      Acteur(
        name: "Aziz Jebali",
        role: "Walid",
        image: "assets/images/actor/Aziz Jebali.jpg",
      ),
      Acteur(
        name: "Bilel Slatnia",
        role: "Bilel",
        image: "assets/images/actor/Bilel Slatnia.jpg",
      ),
      Acteur(
        name: "Bahri Rahali",
        role: "Béchir",
        image: "assets/images/actor/Bahri Rahali.jpg",
      ),
    ],
  ),
  Movie(
    id: 4,
    name: "First Impact",
    description:
        "First Impact est un film (1h 18min) de Brett Bentman avec Tiffany McDonald, Thom Hallum, Kristin Keith. Découvrez 1 Bandes-annonces et le casting de 8 stars sur CinéSéries",
    image: "assets/images/movie/First Impact.jpg",
    etat: false,
    catagory: "Action",
    nbStar: 6,
    nbPerson: 0,
    listActeur: [
      Acteur(
        name: "Thom Hallum",
        role: "William Zito",
        image: "assets/images/actor/Thom Hallum.jpg",
      ),
      Acteur(
        name: "Tiffany McDonald",
        role: "Brenda",
        image: "assets/images/actor/Tiffany McDonald.jpg",
      ),
      Acteur(
        name: "Rosco Nash",
        role: "Ken Hollis",
        image: "assets/images/actor/Rosco Nash.jpg",
      ),
    ],
  ),
  Movie(
    id: 5,
    name: "Ant-Man and the Wasp: Quantumania",
    description:
        "Assistez au début d'une nouvelle dynastie. Les partenaires de super-héros Scott Lang et Hope van Dyne, ainsi que les parents de Hope, Janet van Dyne et Hank Pym, et la fille de Scott, Cassie Lang, se retrouvent à explorer le royaume quantique, à interagir avec de nouvelles créatures étranges et à se lancer dans une aventure qui les poussera au-delà des limites de ce qu'ils croyaient possible.",
    image: "assets/images/movie/Quantumania.jpg",
    etat: false,
    catagory: "science-fiction",
    nbStar: 4,
    nbPerson: 30,
    listActeur: [
      Acteur(
          name: "Paul Rudd",
          role: "Scott Lang",
          image: "assets/images/actor/Paul Rudd.jpg"),
      Acteur(
        name: "Michael Douglas",
        role: "Hank Pym",
        image: "assets/images/actor/Michael Douglas.jpg",
      ),
      Acteur(
        name: "Kathryn Newton",
        role: "Cassie Lang",
        image: "assets/images/actor/Kathryn Newton.jpg",
      ),
    ],
  ),
];
