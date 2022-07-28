


import 'package:bloc/bloc.dart';
import 'package:breaking_bad/data/repository/episode_repository.dart';

import '../../../data/models/episode.dart';
import 'episodes_state.dart';

class EpisodesCubit extends Cubit<EpisodesState> {
  final EpisodesRepository episodesRepository;
  List<Episode> episodes = [];

  EpisodesCubit(this.episodesRepository) : super(EpisodesInitial());

  List<Episode> getAllEpisode() {
    episodesRepository.getAllEpisodes().then((episode) {
      emit(EpisodesLoaded(episode));
      this.episodes = episode;
    });

    return episodes;
  }


}