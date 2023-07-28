import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/features/data/models/character_model.dart';

import '../../../core/constants/constants.dart';
import '../bloc/character_bloc.dart';
import '../widgets/platform_floating_action_button.dart';

class CharacterDetailScreen extends StatefulWidget {
  final CharacterModel character;
  const CharacterDetailScreen({super.key, required this.character});

  @override
  State<CharacterDetailScreen> createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {
  @override
  Widget build(BuildContext context) {
    CharacterModel character = widget.character;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: PlatformFloatingButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        body: Consumer<CharacterBloc>(builder: (context, bloc, child) {
          return DecoratedBox(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/background.png"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                  Container(
                      height: MediaQuery.of(context).size.width * 0.1,
                      width: MediaQuery.of(context).size.width * 0.1,
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.8,
                      ),
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02,
                      ),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: backgroundContainerColor,
                      ),
                      child: character.status ==
                          "Alive"
                          ? SvgPicture.asset(
                          "assets/alive.svg")
                          : character.status ==
                          "Dead"
                          ? SvgPicture.asset(
                          "assets/dead.svg")
                          : SvgPicture.asset(
                          "assets/unknown.svg")),
                  SizedBox(height: MediaQuery.of(context).size.height*0.10,),
                  CircleAvatar(
                      backgroundImage: NetworkImage(character.image),
                      radius: MediaQuery.of(context).size.width * 0.2),
                  Text(
                    character.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.07),
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.width * 0.1,
                        decoration: BoxDecoration(
                            color: backgroundContainerColor,
                            borderRadius: BorderRadius.circular(12),
                            border: const Border(left: BorderSide.none)),
                        child: const Center(
                          child: Text(
                            "Especie",
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.07),
                        //padding: const EdgeInsets.symmetric(vertical: 8).copyWith(left: MediaQuery.of(context).size.width * 0.1,),
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.width * 0.1,
                        decoration: BoxDecoration(
                            color: backgroundColorDetail,
                            borderRadius: BorderRadius.circular(12),
                            border: const Border(left: BorderSide.none)),
                        child: Center(
                          child: Text(
                            character.species,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.07),
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.width * 0.1,
                          decoration: BoxDecoration(
                              color: backgroundContainerColor,
                              borderRadius: BorderRadius.circular(12),
                              border: const Border(left: BorderSide.none)),
                          child: const Center(
                            child: Text(
                              "Tipo",
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.07),
                          //padding: const EdgeInsets.symmetric(vertical: 8).copyWith(left: MediaQuery.of(context).size.width * 0.1,),
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.width * 0.1,
                          decoration: BoxDecoration(
                              color: backgroundColorDetail,
                              borderRadius: BorderRadius.circular(12),
                              border: const Border(left: BorderSide.none)),
                          child: Center(
                            child: Text(
                              character.type == "" ? "Desconocido" : character.type,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.07),
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.width * 0.1,
                        decoration: BoxDecoration(
                            color: backgroundContainerColor,
                            borderRadius: BorderRadius.circular(12),
                            border: const Border(left: BorderSide.none)),
                        child: const Center(
                          child: Text(
                            "Origen",
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.07),
                        //padding: const EdgeInsets.symmetric(vertical: 8).copyWith(left: MediaQuery.of(context).size.width * 0.1,),
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.width * 0.1,
                        decoration: BoxDecoration(
                            color: backgroundColorDetail,
                            borderRadius: BorderRadius.circular(12),
                            border: const Border(left: BorderSide.none)),
                        child: Center(
                          child: Text(
                            character.origin.name.toString(),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.07),
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.width * 0.1,
                          decoration: BoxDecoration(
                              color: backgroundContainerColor,
                              borderRadius: BorderRadius.circular(12),
                              border: const Border(left: BorderSide.none)),
                          child: const Center(
                            child: Text(
                              "Lugar",
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.07),
                          //padding: const EdgeInsets.symmetric(vertical: 8).copyWith(left: MediaQuery.of(context).size.width * 0.1,),
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.width * 0.1,
                          decoration: BoxDecoration(
                              color: backgroundColorDetail,
                              borderRadius: BorderRadius.circular(12),
                              border: const Border(left: BorderSide.none)),
                          child: Center(
                            child: Text(
                              character.location.name.toString(),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ));
        }),
      ),
    );
  }
}
