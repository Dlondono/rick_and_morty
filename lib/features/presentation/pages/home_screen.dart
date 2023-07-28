import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty/features/presentation/pages/character_screen.dart';
import 'package:rick_and_morty/features/presentation/pages/episode_screen.dart';
import 'package:rick_and_morty/features/presentation/pages/locations_screen.dart';

import '../../../core/constants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background.png"),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                const CharacterScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: [
                      Container(
                        margin:EdgeInsets.only(left:MediaQuery.of(context).size.width*0.07,),
                        padding:const EdgeInsets.symmetric(vertical: 8).copyWith(left: MediaQuery.of(context).size.width*0.4,),
                        width:MediaQuery.of(context).size.width*0.7,
                        height:MediaQuery.of(context).size.width*0.1,
                        decoration: BoxDecoration(
                            color: backgroundContainerColor,
                            borderRadius: BorderRadius.circular(12),
                            border: const Border(left: BorderSide.none)
                        ),
                        child: const Align(
                          alignment:Alignment.centerLeft,
                          child: Text(
                            "Personajes"
                          ),
                        ),
                      ),
                      Image.asset("assets/personajes.png",height: MediaQuery.of(context).size.width*0.5,),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                const LocationScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: [
                      Container(
                        margin:EdgeInsets.only(left:MediaQuery.of(context).size.width*0.07,),

                        width:MediaQuery.of(context).size.width*0.5,
                        height:MediaQuery.of(context).size.width*0.1,
                        decoration: BoxDecoration(
                            color: backgroundContainerColor,
                            borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Align(
                          alignment:Alignment.center,
                          child: Text(
                            "Lugares"
                          ),
                        ),
                      ),
                      Padding(
                        padding:const EdgeInsets.symmetric(vertical: 8).copyWith(left: MediaQuery.of(context).size.width*0.4,),
                        child: Image.asset("assets/lugares.png",height: MediaQuery.of(context).size.width*0.5,),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                const EpisodeScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: [
                      Container(
                        margin:EdgeInsets.only(left:MediaQuery.of(context).size.width*0.07,),
                        padding:const EdgeInsets.symmetric(vertical: 8).copyWith(left: MediaQuery.of(context).size.width*0.4,),
                        width:MediaQuery.of(context).size.width*0.7,
                        height:MediaQuery.of(context).size.width*0.1,
                        decoration: BoxDecoration(
                            color: backgroundContainerColor,
                            borderRadius: BorderRadius.circular(12),
                            border: const Border(left: BorderSide.none)
                        ),
                        child: const Align(
                          alignment:Alignment.centerLeft,
                          child: Text(
                            "Episodios"
                          ),
                        ),
                      ),
                      Image.asset("assets/episodios.png",height: MediaQuery.of(context).size.width*0.5,),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
