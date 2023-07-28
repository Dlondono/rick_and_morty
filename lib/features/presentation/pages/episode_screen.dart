import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/features/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morty/features/presentation/bloc/episode_bloc.dart';
import 'package:rick_and_morty/features/presentation/pages/episode_detail_screen.dart';

import '../../../core/constants/constants.dart';
import '../widgets/platform_floating_action_button.dart';

class EpisodeScreen extends StatefulWidget {
  const EpisodeScreen({Key? key}) : super(key: key);

  @override
  State<EpisodeScreen> createState() => _EpisodeScreenState();
}

class _EpisodeScreenState extends State<EpisodeScreen> {

  late ScrollController _scrollController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => context.read<EpisodeBloc>().getEpisodes());
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<EpisodeBloc>().getEpisodes();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: PlatformFloatingButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        body: Consumer<EpisodeBloc>(builder: (context, bloc, child) {
          return DecoratedBox(
              decoration: const BoxDecoration(
              image: DecorationImage(
              image: AssetImage("assets/background.png"),
          fit: BoxFit.cover),
          ),
          child: bloc.episodeState ==EpisodeState.initial ? const Center(child: CircularProgressIndicator(strokeWidth: 4,)) : SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 32.0, bottom: 16),
                  child: Text(
                    "Episodios",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: bloc.episodes.length+1,
                    physics: const ScrollPhysics(),
                    primary: true,
                    itemBuilder: (context, index) {
                      if (index == bloc.episodes.length) {
                        return Visibility(
                            visible: bloc.episodeState ==EpisodeState.loading ? true : false,
                            child: const Center(child: CircularProgressIndicator(strokeWidth: 4,)));
                      } else {
                        return GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                            EpisodeDetailScreen(episode: bloc.episodes[index])));
                          },
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.02),
                                child: Container(
                                  width:MediaQuery.of(context).size.width*0.7,
                                  height:MediaQuery.of(context).size.width*0.1,
                                  decoration: BoxDecoration(
                                      color: backgroundContainerColor,
                                      borderRadius: BorderRadius.circular(16),
                                      border: const Border(left: BorderSide.none)
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(
                                        bloc.episodes[index].name,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    }
                ),
              ],
            ),
          )
          );
        }),
      ),
    );
  }
}
