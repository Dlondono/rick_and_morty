import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/constants.dart';

class PlatformFloatingButton extends StatelessWidget {
  const PlatformFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 40,
      width: 40,
      child: FloatingActionButton(
        backgroundColor: backgroundContainerColor,
        // mini: true,
        onPressed: () {
          Navigator.pop(context);
        },
        child: SvgPicture.asset(
          "assets/back.svg",
          height: MediaQuery.of(context).size.height * 0.03,
        ),
      ),
    );
  }
}
