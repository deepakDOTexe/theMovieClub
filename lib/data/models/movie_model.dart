import 'package:the_movie_club/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity{
  final int id;
  final bool video;
  final int voteCount;
  final double voteAverage; // might not be returned as double from the api
  final String title;
  final String releaseDate;
  final String originalLanguage;
  final String originalTitle;
  final List<int> genreIds;
  final String backdropPath;
  final bool adult;
  final String overview;
  final String posterPath;
  final double popularity; //same here
  final String mediaType;

  MovieModel({
      this.id,
      this.video,
      this.voteCount,
      this.voteAverage,
      this.title,
      this.releaseDate,
      this.originalLanguage,
      this.originalTitle,
      this.genreIds,
      this.backdropPath,
      this.adult,
      this.overview,
      this.posterPath,
      this.popularity,
      this.mediaType,
  }): super(
    id:id,
    title:title,
    backdropPath:backdropPath,
    posterPath:posterPath,
    releaseDate:releaseDate,
    voteAverage:voteAverage,
    overview:overview,
  );
// if returned an int then convert lbrary fails to parse it
// either declare that variable as num or use to_double() method

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
    id : json['id'],
    video : json['video'],
    voteCount : json['vote_count']?.toDouble() ?? 0.0, // if int is returned parse to double or if null is returned set to 0.0 as default value
    voteAverage : json['vote_average'],
    title : json['title'],
    releaseDate : json['release_date'],
    originalLanguage : json['original_language'],
    originalTitle : json['original_title'],
    genreIds : json['genre_ids'].cast<int>(),
    backdropPath : json['backdrop_path'],
    adult : json['adult'],
    overview : json['overview'],
    posterPath : json['poster_path'],
    popularity : json['popularity']?.toDouble() ?? 0.0,
    mediaType : json['media_type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['video'] = this.video;
    data['vote_count'] = this.voteCount;
    data['vote_average'] = this.voteAverage;
    data['title'] = this.title;
    data['release_date'] = this.releaseDate;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['genre_ids'] = this.genreIds;
    data['backdrop_path'] = this.backdropPath;
    data['adult'] = this.adult;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['popularity'] = this.popularity;
    data['media_type'] = this.mediaType;
    return data;
  }
}