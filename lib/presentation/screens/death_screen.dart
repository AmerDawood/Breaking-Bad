import 'package:breaking_bad/business_logic/cubit/Deaths/deaths_cubit.dart';
import 'package:breaking_bad/business_logic/cubit/Deaths/deaths_state.dart';
import 'package:breaking_bad/data/models/death.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/my_colors.dart';
import '../../constants/strings.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../widgets/death_item.dart';


class DeathScreen extends StatefulWidget {
  const DeathScreen({Key? key}) : super(key: key);

  @override
  _DeathScreenState createState() => _DeathScreenState();
}

class _DeathScreenState extends State<DeathScreen> {
  late List<Death> allDeaths;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DeathCubit>(context).getAllDeaths();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<DeathCubit, DeathsState>(
      builder: (context, state) {
        if (state is DeathsLoaded) {
          allDeaths = (state).death;
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
            itemCount: allDeaths.length,
            itemBuilder:(context, index) {
              return DeathItem(death: allDeaths[index],);

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

