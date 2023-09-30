import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:dio/dio.dart';

import '../../domain/datasources/movies_datasource.dart';
import '../models/moviedb/moviedb_response.dart';

class MovidbDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themovidb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDnKey,
        'language': 'es-MX'
      }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');
    final List<Movie> movies =
        response.data.map((video) => MovieDbResponse.fromJson(video)).toList();

    return movies;
  }
}
