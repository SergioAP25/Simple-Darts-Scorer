import 'dart:ui';

import 'package:dartsapp/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Image.asset(
              "assets/test.jpg",
              fit: BoxFit.cover,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 5.0,
            ),
            child: Container(
              alignment: Alignment.center,
            ),
          ),
          const HomeViewWidgets()
        ],
      ),
    );
  }
}

class HomeViewWidgets extends StatefulWidget {
  const HomeViewWidgets({super.key});

  @override
  State<HomeViewWidgets> createState() => _HomeViewWidgetsState();
}

class _HomeViewWidgetsState extends State<HomeViewWidgets> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Container(
            width: 500,
            height: 50,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 19, 18, 18).withOpacity(0.8),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 3,
                  offset: Offset(3, 3),
                  blurRadius: 5,
                  color: Color.fromARGB(255, 44, 193, 212).withOpacity(0.3),
                ),
              ],
            ),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(playRoute);
              },
              child: Text(
                "Jugar",
                style: GoogleFonts.pressStart2p(),
              ),
            ),
          ),
        ),
        Flexible(
          child: const SizedBox(
            height: 5,
          ),
        ),
        Flexible(
          child: const SizedBox(
            height: 5,
          ),
        ),
        Flexible(
          child: Container(
              width: 500,
              height: 50,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 3,
                      offset: Offset(-3, -3),
                      blurRadius: 5,
                      color: const Color.fromARGB(255, 199, 30, 30)
                          .withOpacity(0.3),
                    ),
                  ],
                  color: Colors.black.withOpacity(0.8),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Historial de partidas",
                  style: GoogleFonts.pressStart2p(),
                ),
              )),
        )
      ],
    ));
  }
}
