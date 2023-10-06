import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider =
    StateNotifierProvider<actorsByMovieNotifier, Map<String, List<Actor>>>(
        (ref) {
  final actorRepository = ref.watch(actorRepositoryProvider).getActorsByMovie;
  return actorsByMovieNotifier(getActors: actorRepository);
});

/*
  {
    '505642': Actor[],
    '505643': Actor[],
  }
*/

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class actorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActors;

  actorsByMovieNotifier({
    required this.getActors,
  }) : super({});

  Future<void> loadActor(String movieId) async {
    if (state[movieId] != null) return;
    final actor = await getActors(movieId);
    state = {...state, movieId: actor};
  }
}
