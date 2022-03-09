import 'package:book_my_show/models/movie.dart';

class movie_operations {
  _movie_operations() {}
  static movie_operations _movieOperations = movie_operations();

  static movie_operations getInstance() {
    return _movieOperations;
  }

  List<movie> getMovies() {
    return [
      movie(
          movie_name: "Avengers",
          movie_image:
              "https://static1.srcdn.com/wordpress/wp-content/uploads/2022/02/Marvels-Avengers-full-roster-2022.jpeg",
          movie_language: "English",
          movie_dimensions: "3D",
          movie_votes: 8763,
          movie_percentage_votes: 87,
          movie_certificate: "U"),
      movie(
          movie_name: "The Pirates of Caribbean",
          movie_image:
              "https://www.looper.com/img/gallery/why-pirates-of-the-caribbean-6-isnt-a-sequel/l-intro-1615306947.jpg",
          movie_language: "English",
          movie_dimensions: "2D",
          movie_votes: 5932,
          movie_percentage_votes: 85,
          movie_certificate: "UA"),
      movie(
          movie_name: "The Matrix 4",
          movie_image:
              "https://s1.cdn.autoevolution.com/images/news/the-matrix-4-title-and-trailer-action-revealed-during-wbs-cinemacon-event-168197-7.jpg",
          movie_language: "English",
          movie_dimensions: "3D",
          movie_votes: 4621,
          movie_percentage_votes: 65,
          movie_certificate: "U"),
      movie(
          movie_name: "SpiderMan:No Way Home",
          movie_image:
              "https://images.hindustantimes.com/img/2021/11/09/1600x900/spider-man_no_way_home_1636451315678_1636451323010.png",
          movie_language: "English",
          movie_dimensions: "3D",
          movie_votes: 8756,
          movie_percentage_votes: 89,
          movie_certificate: "U"),
      movie(
          movie_name: "The Ironman",
          movie_image:
              "https://www.giantfreakinrobot.com/wp-content/uploads/2021/05/iron-man-flying.jpeg",
          movie_language: "English",
          movie_dimensions: "2D",
          movie_votes: 6982,
          movie_percentage_votes: 81,
          movie_certificate: "UA"),
    ];
  }
}
