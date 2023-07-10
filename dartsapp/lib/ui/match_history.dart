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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  width: constraints.maxWidth * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 3,
                        blurRadius: 5,
                        color: const Color.fromARGB(255, 194, 167, 17)
                            .withOpacity(0.3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: 500,
                          height: 500,
                          child: BlocBuilder<DomainBloc, DomainState>(
                            builder: (context, state) {
                              if (state is DomainStateLoadedMatchHistory) {
                                _matchHistory = state.matchHistory;
                                return ListView.builder(
                                  itemCount: _matchHistory.length,
                                  itemBuilder: (context, index) {
                                    return Center(
                                        child: Text(
                                      _matchHistory[index].player1,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 42),
                                    ));
                                  },
                                );
                              }
                              return ListView.builder(
                                itemCount: _matchHistory.length,
                                itemBuilder: (context, index) {
                                  return Center(
                                      child: Text(
                                    _matchHistory[index].player1,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 42),
                                  ));
                                },
                              );
                            },
                          ),
                        ),
                      )
                    ],
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
