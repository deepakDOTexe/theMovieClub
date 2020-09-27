import 'dart:convert';

import 'package:http/http.dart';
import 'package:the_movie_club/data/core/api_constants.dart';

class ApiClient{
  final Client _client;

  ApiClient(this._client);

  dynamic get(String path) async {
    final response = await _client.get(
      '${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}',
      headers: {
        'Content-Type':'application/json',
      },
    );

    if (response.statusCode == 200){
      final responseBody = json.decode(response.body);
      // final movies = MoviesResultModel.fromJson(responseBody).movies;
      // print(movies);
      return responseBody;
    }else{
      throw Exception(response.reasonPhrase);
    }  
  }


}