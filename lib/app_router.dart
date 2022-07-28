import 'package:breaking_bad/data/web_services/death_web_services.dart';
import 'package:breaking_bad/presentation/screens/death_screen.dart';
import 'package:breaking_bad/presentation/screens/episodes_screen.dart';
import 'package:breaking_bad/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business_logic/cubit/Deaths/deaths_cubit.dart';
import 'business_logic/cubit/characters/characters_cubit.dart';
import 'business_logic/cubit/episodes/episodes-cubit.dart';
import 'data/repository/characters_repository.dart';
import 'data/repository/death_repository.dart';
import 'data/repository/episode_repository.dart';
import 'data/web_services/characters_web_services.dart';
import 'data/web_services/episode_web_services.dart';
import 'presentation/screens/characters_details_screen.dart';
import 'presentation/screens/characters_screen.dart';

import 'constants/strings.dart';
import 'data/models/characters.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  late EpisodesRepository episodeRepository;
  late EpisodesCubit episodesCubit;


  late DeathsRepository deathsRepository;
  late DeathCubit deathCubit;




  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);




    episodeRepository = EpisodesRepository(EpisodeWebServices());

    episodesCubit = EpisodesCubit(episodeRepository);


    deathsRepository = DeathsRepository(DeathWebServices());
    deathCubit = DeathCubit(deathsRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {

      // case charactersScreen:
      //   return MaterialPageRoute(
      //    builder:(context){
      //      return  SplashScreen();
      //    }
      //     );

      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext contxt) => charactersCubit,
            child: CharactersScreen(),
          ),
        );


      case episodesScreen :
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext contxt) => episodesCubit,
            child: EpisodesScreen(),
          ),
        );

      case deathsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext contxt) => deathCubit,
            child: DeathScreen(),
          ),
        );

      case characterDetailsScreen:
        final character = settings.arguments as Character;

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                CharactersCubit(charactersRepository),
            child: CharacterDetailsScreen(
              character: character,
            ),
          ),
        );
    }
  }
}