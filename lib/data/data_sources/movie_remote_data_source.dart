import 'package:the_movie_club/data/core/api_client.dart';
import 'package:the_movie_club/data/models/movie_model.dart';
import 'package:the_movie_club/data/models/movies_result_model.dart';


abstract class MovieRemoteDataSource {
  
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getComingSoon();

}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {

  final ApiClient _client; 

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    final response = await _client.get('trending/movie/day');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;

  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await _client.get('movie/popular/day');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getComingSoon() async{
    final response = await _client.get('movie/upcoming');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async{
    final response = await _client.get('movie/now_playing');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  
  
}