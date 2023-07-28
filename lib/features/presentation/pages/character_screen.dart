import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/features/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morty/features/presentation/pages/character_detail_screen.dart';

import '../../../core/constants/constants.dart';
import '../widgets/platform_floating_action_button.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late ScrollController _scrollController;

  TextEditingController queryController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => context.read<CharacterBloc>().getCharacters());
    _scrollController = ScrollController();
    _scrollController.addListener((){
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<CharacterBloc>().getCharacters();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
            child: bloc.characterState == CharacterState.initial
                ? const Center(
                    child: CircularProgressIndicator(
                    strokeWidth: 4,
                  ))
                : Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.03,
                    ),
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 32.0, bottom: 16),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width*0.75,
                              child: Text(
                                "Personajes",
                                style: Theme.of(context).textTheme.titleLarge,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Provider.of<CharacterBloc>(context, listen: false)
                                      .sortCharacters(CharacterSort.alphabet);
                                },
                                  child: Icon(Icons.sort_by_alpha,color: bloc.characterSort == CharacterSort.alphabet ? Colors.amber : Colors.white,)),
                              GestureDetector(
                                  onTap: (){
                                    Provider.of<CharacterBloc>(context, listen: false)
                                        .sortCharacters(CharacterSort.status);
                                  },
                                  child: Icon(Icons.heart_broken,color: bloc.characterSort == CharacterSort.status ? Colors.amber :Colors.white,)),
                              GestureDetector(
                                onTap: (){
                                  Provider.of<CharacterBloc>(context, listen: false)
                                      .sortCharacters(CharacterSort.gender);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.female,color: bloc.characterSort == CharacterSort.gender ? Colors.amber :Colors.white,),
                                    Icon(Icons.male,color: bloc.characterSort == CharacterSort.gender ? Colors.amber : Colors.white,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          /*TextFormField(
                            decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                                filled: true,
                                fillColor: Color(0xff3B3B3B)),
                            controller: queryController,
                            onFieldSubmitted: (value) {
                              Provider.of<CharacterBloc>(context, listen: false)
                                  .getCharacters();
                            },
                          ),*/
                          ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: bloc.characters.length + 1,
                              physics: const ScrollPhysics(),
                              primary: true,
                              itemBuilder: (context, index) {
                                if (index == bloc.characters.length) {
                                  return Visibility(
                                      visible: bloc.characterState ==
                                              CharacterState.loading
                                          ? true
                                          : false,
                                      child: const Center(
                                          child: CircularProgressIndicator(
                                        strokeWidth: 4,
                                      )));
                                } else {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical:
                                            MediaQuery.of(context).size.height *
                                                0.01),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CharacterDetailScreen(
                                                        character:
                                                            bloc.characters[
                                                                index])));
                                      },
                                      child: Row(
                                        children: [
                                          Stack(
                                            alignment: AlignmentDirectional
                                                .centerStart,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.07,
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                            vertical: 8)
                                                        .copyWith(
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.1,
                                                ),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.7,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.1,
                                                decoration: BoxDecoration(
                                                    color:
                                                        backgroundContainerColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    border: const Border(
                                                        left: BorderSide.none)),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    bloc.characters[index].name,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                              CircleAvatar(
                                                backgroundColor: backgroundContainerColor,
                                                  backgroundImage: NetworkImage(
                                                      bloc.characters[index]
                                                          .image),
                                                  radius: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.075),
                                              Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.1,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.1,
                                                  margin: EdgeInsets.only(
                                                    left: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.8,
                                                  ),
                                                  padding: EdgeInsets.all(
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.02,
                                                  ),
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color:
                                                        backgroundContainerColor,
                                                  ),
                                                  child: bloc.characters[index]
                                                              .status ==
                                                          "Alive"
                                                      ? SvgPicture.asset(
                                                          "assets/alive.svg")
                                                      : bloc.characters[index]
                                                                  .status ==
                                                              "Dead"
                                                          ? SvgPicture.asset(
                                                              "assets/dead.svg")
                                                          : SvgPicture.asset(
                                                              "assets/unknown.svg")),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                              }),
                        ],
                      ),
                    ),
                  ),
          );
        }),
      ),
    );
  }
}

