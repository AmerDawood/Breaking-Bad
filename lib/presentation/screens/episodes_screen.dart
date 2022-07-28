import 'package:breaking_bad/business_logic/cubit/episodes/episodes-cubit.dart';
import 'package:breaking_bad/data/models/episode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../business_logic/cubit/characters/characters_cubit.dart';
import '../../business_logic/cubit/episodes/episodes_state.dart';
import '../../constants/my_colors.dart';
import '../../constants/strings.dart';
import '../../data/models/characters.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../widgets/character_item.dart';
import '../widgets/episodes_item.dart';

class EpisodesScreen extends StatefulWidget {
  const EpisodesScreen({Key? key}) : super(key: key);

  @override
  _EpisodesScreenState createState() => _EpisodesScreenState();
}

class _EpisodesScreenState extends State<EpisodesScreen> {
  late List<Episode> allEpisodes;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<EpisodesCubit>(context).getAllEpisode();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<EpisodesCubit, EpisodesState>(
      builder: (context, state) {
        if (state is EpisodesLoaded) {
          allEpisodes = (state).episodes;
          return buildLoadedListWidgets();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
   return
     SizedBox(
       height: 800,
       child: Container(
         // margin: EdgeInsets.all(12),
         child:  ListView.builder(
           itemCount: allEpisodes.length,
           itemBuilder:(context, index) {
           return EpisodesItem(episode: allEpisodes[index],);

         },
         ),
       ),
     );

  }


  Widget _buildAppBarTitle() {
    return Text(
      'Characters',
      style: TextStyle(color: MyColors.myGrey),
    );
  }

  Widget buildNoInternetWidget() {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Can\'t connect .. check internet',
              style: TextStyle(
                fontSize: 22,
                color: MyColors.myGrey,
              ),
            ),
            Image.asset('images/no_internet.png')
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: MyColors.myYellow,
        leading:  IconButton(
          onPressed: (){
            Navigator.pushNamed(context, charactersScreen);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title:_buildAppBarTitle(),
      ),
      body: OfflineBuilder(

        connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
            ) {
          final bool connected = connectivity != ConnectivityResult.none;

          if (connected) {
            return buildBlocWidget();
          } else {
            return buildNoInternetWidget();
          }
        },
        child: showLoadingIndicator(),
      ),
    );
  }
}

