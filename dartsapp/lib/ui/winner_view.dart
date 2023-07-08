import 'package:flutter/material.dart';

class WinnerView extends StatefulWidget {
  const WinnerView({super.key});

  @override
  State<WinnerView> createState() => _WinnerViewState();
}

class _WinnerViewState extends State<WinnerView> {
  String? args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black,
            child: Column(children: [
              Text(
                "Ha ganado TEMPNAME! Felicidades!",
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
              Image.asset("assets/winner.jpg")
            ]),
          );
        },
      ),
    );
  }
}
