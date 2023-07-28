import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/features/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morty/features/presentation/bloc/location_bloc.dart';
import 'package:rick_and_morty/features/presentation/pages/location_detail_screen.dart';

import '../../../core/constants/constants.dart';
import '../widgets/platform_floating_action_button.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late ScrollController _scrollController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => context.read<LocationBloc>().getLocations());
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<LocationBloc>().getLocations();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: PlatformFloatingButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        body: Consumer<LocationBloc>(builder: (context, bloc, child) {
          return DecoratedBox(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background.png"),
                  fit: BoxFit.cover),
            ),
            child: bloc.locationState == LocationState.initial
                ? const Center(child: CircularProgressIndicator(strokeWidth: 4,))
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
                            child: Text(
                              "Lugares",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 2,
                              crossAxisSpacing: 12,
                              // width / height: fixed for *all* items
                              childAspectRatio: 1.5,
                            ),
                            itemCount: bloc.locations.length+1,
                            // return a custom ItemCard
                            itemBuilder: (context, index) {
                              if (index == bloc.locations.length) {
                                return Visibility(
                                    visible: bloc.locationState ==
                                            LocationState.loading
                                        ? true
                                        : false,
                                    child: const Center(
                                        child: CircularProgressIndicator(
                                      strokeWidth: 4,
                                    )));
                              } else {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                                    LocationDetailScreen(location: bloc.locations[index])));
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color:
                                                backgroundContainerColorLocations,
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.12,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: Text(
                                                bloc.locations[index].name,
                                                style: const TextStyle(
                                                    fontSize: 18),
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                            ),
                                            Text(bloc.locations[index].type,
                                                style: const TextStyle(
                                                    fontSize: 14),
                                                textAlign: TextAlign.center),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                          )
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
