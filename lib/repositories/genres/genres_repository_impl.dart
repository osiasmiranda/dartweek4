import 'package:firebase_remote_config/firebase_remote_config.dart';
import '/app/rest_client/rest_client.dart';
import '/models/genre_model.dart';

import './genres_repository.dart';

class GenresRepositoryImpl implements GenresRepository {
  final url = '/genre/movie/list';

  final RestClient _restClient;

  GenresRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<GenreModel>> getGenres() async {
    final result = await _restClient.get<List<GenreModel>>(url, query: {
      'api_key': RemoteConfig.instance.getString('api_token'),
      'language': 'pt-BR',
    }, decoder: (data) {
      final resultData = data['genres'];
      if (resultData != null) {
        return resultData.map<GenreModel>((genres) => GenreModel.fromMap(genres)).toList();
      }
      return <GenreModel>[];
    });

    if (result.hasError) {
      print('Erro ao buscar Genres ==>>>>[${result.statusText}]');
      //print(result.statusText);
      throw Exception('Erro ao buscar Gêneros');
    }
    return result.body ?? <GenreModel>[];
  }
}
