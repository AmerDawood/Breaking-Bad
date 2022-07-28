import 'package:breaking_bad/data/web_services/episode_web_services.dart';

import '../models/episode.dart';

class EpisodesRepository {
  final EpisodeWebServices episodesWebServices;

  EpisodesRepository(this.episodesWebServices);

  Future<List<Episode>> getAllEpisodes() async {
    final episodes = await episodesWebServices.getAllEpisode();
    return episodes.map((episode) => Episode.fromJson(episode)).toList();
  }

}