import 'package:the_movie_club/data/models/movie_model.dart';

class MoviesResultModel {
  // int page;
  List<MovieModel> movies;
  // int totalPages;
  // int totalResults;

  MoviesResultModel(
      {this.movies});

  MoviesResultModel.fromJson(Map<String, dynamic> json) {
    // page = json['page'];
    if (json['results'] != null) {
      movies = new List<MovieModel>();
      json['results'].forEach((v) {
        movies.add(new MovieModel.fromJson(v));
      });
    }
    // totalPages = json['total_pages'];
    // totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['page'] = this.page;
    if (this.movies != null) {
      data['results'] = this.movies.map((v) => v.toJson()).toList();
    }
    // data['total_pages'] = this.totalPages;
    // data['total_results'] = this.totalResults;
    return data;
  }
}


