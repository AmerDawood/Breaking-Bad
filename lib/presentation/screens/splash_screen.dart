import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/characters/characters_cubit.dart';
import '../../data/repository/characters_repository.dart';
import '../../data/web_services/characters_web_services.dart';
import 'characters_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    // TODO: implement initState
    super.initState();

    // Future.delayed(Duration(seconds: 3),(){
    //  Navigator.pushReplacement(context,
    //      MaterialPageRoute(
    //        builder: (_) => BlocProvider(
    //          create: (BuildContext contxt) => CharactersCubit(
    //            CharactersRepository(
    //                CharactersWebServices()
    //            ),
    //          ),
    //          child: CharactersScreen(),
    //        ),
    //      ),
    //  );
    //
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/splash_screen.jpg',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

        ],
      ),
    );
  }
}