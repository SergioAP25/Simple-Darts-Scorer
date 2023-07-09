import 'dart:ui';

import 'package:dartsapp/constants/routes.dart';
import 'package:dartsapp/constants/views.dart';
import 'package:dartsapp/domain/bloc/domain_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../domain/bloc/domain_bloc.dart';
import '../domain/bloc/domain_state.dart';

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
  final DomainBloc _gameBloc = DomainBloc();
  int _currentGameCount = 0;

  @override
  Widget build(BuildContext context) {
    _gameBloc.add(const CountCurrentGameEvent());
    return BlocProvider(
      create: (context) => _gameBloc,
      child: Center(
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
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 3,
                    offset: const Offset(3, 3),
                    blurRadius: 5,
                    color: const Color.fromARGB(255, 44, 193, 212)
                        .withOpacity(0.3),
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
          const Flexible(
            child: SizedBox(
              height: 5,
            ),
          ),
          Flexible(
            child: Container(
              width: 500,
              height: 50,
              color: const Color.fromARGB(255, 19, 18, 18).withOpacity(0.8),
              child: BlocBuilder<DomainBloc, DomainState>(
                builder: (context, state) {
                  if (state is DomainStateLoadedCountCurrentGame) {
                    _currentGameCount = state.currentGameCount;
                  }
                  return TextButton(
                    onPressed: _currentGameCount == 0
                        ? null
                        : () {
                            Navigator.of(context)
                                .pushNamed(gameRoute, arguments: [
                              currentGame,
                            ]);
                          },
                    child: Text(
                      "Continuar",
                      style: GoogleFonts.pressStart2p(),
                    ),
                  );
                },
              ),
            ),
          ),
          const Flexible(
            child: SizedBox(
              height: 5,
            ),
          ),
          const Flexible(
            child: SizedBox(
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
                        offset: const Offset(-3, -3),
                        blurRadius: 5,
                        color: const Color.fromARGB(255, 199, 30, 30)
                            .withOpacity(0.3),
                      ),
                    ],
                    color: Colors.black.withOpacity(0.8),
                    borderRadius: const BorderRadius.only(
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
      )),
    );
  }
}
