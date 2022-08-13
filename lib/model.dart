class Movie {
  String title;

  String age;

  String categorires;

  String imageURL;

  String logo;

  double rating;

  String technology;

  DateTime date;

  Movie(
      {required this.title,
      required this.imageURL,
      required this.logo,
      required this.age,
      required this.rating,
      required this.date,
      required this.categorires,
      required this.technology});
}

final List<Movie> movies = [
  Movie(
      title: 'The Irishman',
      imageURL: 'assets/images/backgrounds/',
      logo: 'assets/images/logos/irishman.png',
      age: 'R',
      rating: 8,
      date: DateTime(2019),
      categorires: 'Crime, Drama, Thriller',
      technology: 'DataSat, Dolby Digital '),
  Movie(
      title: 'Les Minions 2',
      imageURL: 'assets/images/backgrounds/',
      logo: 'assets/images/logos/minions2.png',
      age: 'R',
      rating: 6.7,
      date: DateTime(2022),
      categorires: 'Comedy',
      technology: 'DataSat, Dolby Digital '),
  Movie(
      title: 'JOKER',
      imageURL: 'assets/images/backgrounds/',
      logo: 'assets/images/logos/joker.png',
      age: '12+',
      rating: 8.7,
      date: DateTime(2019),
      categorires: 'Crime, Drama, Thriller',
      technology: 'DataSat, Dolby Digital '),
  Movie(
      title: 'Avengers Endgame',
      imageURL: 'assets/images/backgrounds/',
      logo: 'assets/images/logos/avengers.png',
      age: 'PG-13',
      rating: 8.5,
      date: DateTime(2019),
      categorires: ' Action, Adventure, Drama',
      technology: 'DataSat, Dolby Digital '),
];
