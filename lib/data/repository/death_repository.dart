import 'package:breaking_bad/data/models/death.dart';
import 'package:breaking_bad/data/web_services/death_web_services.dart';
import 'package:breaking_bad/data/web_services/episode_web_services.dart';

import '../models/episode.dart';

class DeathsRepository {
  final DeathWebServices deathWebServices;

  DeathsRepository(this.deathWebServices);

  Future<List<Death>> getAllDeaths() async {
    final deaths = await deathWebServices.getAllDeaths();
    return deaths.map((d) => Death.fromJson(d)).toList();
  }

}