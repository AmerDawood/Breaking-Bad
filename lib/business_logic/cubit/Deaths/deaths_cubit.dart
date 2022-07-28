import 'package:bloc/bloc.dart';
import 'package:breaking_bad/business_logic/cubit/Deaths/deaths_state.dart';
import 'package:breaking_bad/data/models/death.dart';
import 'package:breaking_bad/data/repository/death_repository.dart';

import '../../../data/models/characters.dart';

class DeathCubit extends Cubit<DeathsState> {
  final DeathsRepository deathsRepository;
  List<Death> deaths = [];

  DeathCubit(this.deathsRepository) : super(DeathInitial());

  List<Death> getAllDeaths() {
    deathsRepository.getAllDeaths().then((death) {
      emit(DeathsLoaded(death));
      this.deaths = death;
    });

    return deaths;
  }


}