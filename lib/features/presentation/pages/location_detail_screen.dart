import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/features/data/models/location_model.dart';

import '../../../core/constants/constants.dart';
import '../bloc/character_bloc.dart';
import '../widgets/platform_floating_action_button.dart';
import 'character_detail_screen.dart';

class LocationDetailScreen extends StatefulWidget {
  final LocationModel location;
  const LocationDetailScreen({Key? key, required this.location})
      : super(key: key);

  @override
  State<LocationDetailScreen> createState() => _LocationDetailScreenState();
}

class _LocationDetailScreenState extends State<LocationDetailScreen> {
  @override
  Widget build(BuildContext context) {
    LocationModel location = widget.location;
    return SafeArea(
        child: Scaffold(
            floatingActionButton: PlatformFloatingButton(),
            floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/background.png"),
                      fit: BoxFit.cover),
                ),
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 32,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                          child: Text(location.name,
                            style: Theme.of(context).textTheme.titleLarge,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.07),
                          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * 0.03),
                          decoration: BoxDecoration(
                              color: backgroundColorAlt,
                              borderRadius: BorderRadius.circular(12),
                              border: const Border(left: BorderSide.none)),
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  location.dimension,
                                ),
                                Text(
                                  location.type,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 32,),
                        Consumer<CharacterBloc>(builder: (context, bloc, child) {
                          var random=3 + Random().nextInt(12);

                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: MediaQuery.of(context).size.width * 0.07),
                            child: Column(
                              children: [
                                for(int i = 0; i < random; i++) ...[
                                  const SizedBox(height: 4,),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CharacterDetailScreen(
                                                      character:
                                                      bloc.characters[
                                                      i])));
                                    },
                                    child: Row(
                                        children: [

                                          Stack(
                                              alignment: AlignmentDirectional.centerStart,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                    left: MediaQuery.of(context).size.width * 0.07,
                                                  ),
                                                  padding: const EdgeInsets.symmetric(vertical: 8)
                                                      .copyWith(
                                                    left: MediaQuery.of(context).size.width * 0.1,
                                                  ),
                                                  width: MediaQuery.of(context).size.width * 0.7,
                                                  height: MediaQuery.of(context).size.width * 0.1,
                                                  decoration: BoxDecoration(
                                                      color: backgroundContainerColor,
                                                      borderRadius: BorderRadius.circular(12),
                                                      border: const Border(left: BorderSide.none)),
                                                  child: Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Text(
                                                      bloc
                                                          .characters[i]
                                                          .name,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                                CircleAvatar(
                                                    backgroundImage: NetworkImage(bloc
                                                        .characters[i]
                                                        .image),
                                                    radius:
                                                    MediaQuery.of(context).size.width * 0.075),
                                              ])

                                        ]),
                                  ),
                                ]
                              ],
                            ),
                          );
                        }),
                      ]
                  ),
                ),
              ),
            )));
  }
}
