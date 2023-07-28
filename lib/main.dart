import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/features/data/datasource/character_datasource.dart';
import 'package:rick_and_morty/features/data/datasource/episodes_datasource.dart';
import 'package:rick_and_morty/features/data/datasource/locations_datasource.dart';
import 'package:rick_and_morty/features/data/repositories/character_repository.dart';
import 'package:rick_and_morty/features/data/repositories/episode_repository.dart';
import 'package:rick_and_morty/features/data/repositories/location_repository.dart';
import 'package:rick_and_morty/features/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morty/features/presentation/bloc/episode_bloc.dart';
import 'package:rick_and_morty/features/presentation/bloc/location_bloc.dart';
import 'package:rick_and_morty/features/presentation/pages/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CharacterBloc>(
          create: (_) => CharacterBloc(characterRepository: CharacterRepositoryImpl(characterDataSource: CharacterDataSourceImpl())),
        ),
        ChangeNotifierProvider<EpisodeBloc>(
          create: (_) => EpisodeBloc(episodeRepository: EpisodeRepositoryImpl(episodesDataSource: EpisodeDataSourceImpl())),
        ),
        ChangeNotifierProvider<LocationBloc>(
          create: (_) => LocationBloc(locationRepository: LocationRepositoryImpl(locationsDataSource: LocationsDataSourceImpl())),
        ),
      ],

      child: MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          textTheme: GoogleFonts.patrickHandTextTheme(Theme.of(context).textTheme,).copyWith(
            displayLarge: const TextStyle(color: Colors.white),
            titleLarge: GoogleFonts.patrickHand(color: Colors.white,fontSize: 34),
            titleMedium: const TextStyle(color: Colors.white),
            bodyMedium: GoogleFonts.patrickHand(color: Colors.white,fontSize: 18),

          ),
          primarySwatch: Colors.blue,

        ),
        home: const SplashScreen(),
      ),
    );
  }
}

