import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/features/presentation/pages/home_screen.dart';

import '../bloc/character_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => goTo());
  }
  @override
  void didChangeDependencies() {
    // Adjust the provider based on the image type
    precacheImage(AssetImage('assets/background.png'),context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/splash.gif",
      height: 125.0,
      width: 125.0,
    );
  }
  Future goTo() async{
    Provider.of<CharacterBloc>(context, listen: false)
        .getCharacters();
   await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>
    const HomeScreen()));
  }
}
