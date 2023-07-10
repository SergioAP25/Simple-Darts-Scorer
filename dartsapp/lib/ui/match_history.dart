import 'dart:ui';

import 'package:dartsapp/domain/bloc/domain_event.dart';
import 'package:dartsapp/domain/models/match_history_game_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/routes.dart';
import '../domain/bloc/domain_bloc.dart';
import '../domain/bloc/domain_state.dart';

class MatchHistory extends StatefulWidget {
  const MatchHistory({super.key});

  @override
  State<MatchHistory> createState() => _MatchHistoryState();
}

class _MatchHistoryState extends State<MatchHistory> {
  final DomainBloc _matchHistoryBloc = DomainBloc();
  List<MatchHistoryGameModel> _matchHistory = [];
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String test =
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
    _matchHistoryBloc.add(const GetMatchHistoryEvent());
    return BlocProvider(
      create: (context) => _matchHistoryBloc,
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: Image.asset(
                    "assets/winner.jpg",
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
                Container(
                  height: constraints.maxHeight * 0.75,
                  width: constraints.maxWidth * 0.85,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 3,
                        blurRadius: 5,
                        color: const Color.fromRGBO(194, 167, 17, 1)
                            .withOpacity(0.3),
                      ),
                    ],
                  ),
                  child: BlocBuilder<DomainBloc, DomainState>(
                    builder: (context, state) {
                      if (state is DomainStateLoadedMatchHistory) {
                        _matchHistory = state.matchHistory;
                        return Column(
                          children: [
                            SizedBox(
                                width: double.infinity,
                                child: Container(
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Color.fromRGBO(
                                                  134, 116, 11, 0.5),
                                              width: 3))),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 135,
                                      ),
                                      SizedBox(
                                        width: 200,
                                        child: Text(
                                          "Partida",
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 42,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 225,
                                      ),
                                      SizedBox(
                                        width: 200,
                                        child: Text(
                                          "Ganador",
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 42,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 95,
                                      ),
                                      SizedBox(
                                        width: 200,
                                        child: Text(
                                          "Fecha",
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 42,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            Expanded(
                              child: ListView.builder(
                                itemCount: _matchHistory.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 200,
                                        child: Text(
                                          test,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 42,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: Image.asset("assets/vs.png")),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        width: 200,
                                        child: Text(
                                          test,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 42),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 100,
                                      ),
                                      SizedBox(
                                        width: 200,
                                        child: Text(
                                          test,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 42),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 100,
                                      ),
                                      SizedBox(
                                        width: 200,
                                        child: Text(
                                          test,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 42),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      }
                      return ListView.builder(
                        itemCount: _matchHistory.length,
                        itemBuilder: (context, index) {
                          return const Center(
                              child: Text(
                            "",
                          ));
                        },
                      );
                    },
                  ),
                ),
                Positioned(
                  left: constraints.maxWidth * 0.01,
                  top: constraints.maxHeight * 0.01,
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                    iconSize: 50,
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          homeRoute, (Route<dynamic> route) => false);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
