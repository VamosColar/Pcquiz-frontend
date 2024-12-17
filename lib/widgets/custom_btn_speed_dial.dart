import 'package:educagame/app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class CustomBtnSpeedDial extends StatelessWidget {
  final Color overlayColor;
  final Color backgroundColor;
  final Color foregroundColor;
  final Icon mainIcon;

  const CustomBtnSpeedDial({
    Key? key,
    this.overlayColor = const Color.fromARGB(255, 61, 45, 9),
    this.backgroundColor = const Color(0xFFEAC674),
    this.foregroundColor = const Color(0xff793C0B),
    this.mainIcon = const Icon(
      Icons.settings,
      size: 30,
      color: Color(0xFFDE3400),
      shadows: [
        Shadow(
          blurRadius: 4.0,
          color: Color(0xffFAE7CD),
          offset: Offset(2.0, 1.0),
        ),
      ],
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      overlayColor: overlayColor,
      direction: SpeedDialDirection.down,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.share),
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          onTap: () => print('Compartilhar'),
        ),
        SpeedDialChild(
          child: const Icon(Icons.help_outline, size: 30),
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          onTap: () => print('Ajuda'),
        ),
        // SpeedDialChild(
        //   backgroundColor: backgroundColor,
        //   foregroundColor: foregroundColor,
        //   child: const Icon(Icons.notifications_off_sharp),
        //   onTap: () => print('Notificações'),
        // ),
        SpeedDialChild(
          child: const Icon(Icons.output_rounded),
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          onTap: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          ),
        ),
      ],
      child: mainIcon,
    );
  }
}
