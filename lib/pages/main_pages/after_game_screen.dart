import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:quizlen/components/reusable_widgets.dart';
import 'package:quizlen/extension/context_extension.dart';

void main() => runApp(AfterGameScreen(score: 0,));

class AfterGameScreen extends StatefulWidget {
  final int score;

  const AfterGameScreen({Key? key, required this.score})
      : super(key: key);

  @override
  State<AfterGameScreen> createState() => _AfterGameScreenState();
}

class _AfterGameScreenState extends State<AfterGameScreen> {

  bool isPlaying=false;
  late ConfettiController _controllerTopCenter;

  @override
  void dispose() {
    _controllerTopCenter.dispose();
    super.dispose();
  }

  @override
  void initState() {


    super.initState();
    _controllerTopCenter = ConfettiController(duration: const Duration(seconds: 5));
  }



  @override
  Widget build(BuildContext context) {
    setState(() {
      _controllerTopCenter.play();
    });

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
            backgroundColor: Color(0xffEAEAEA),
            body: Padding(
              padding: EdgeInsets.only(top: context.dynamicHeight(0.1)),
              child: Column(
                children: [
                  Center(
                      child: Column(
                    children: [
                      Text(
                        "Tebrikler!",
                        style: Theme.of(context).textTheme.headline3?.copyWith(
                            color: Color(0xffFFBA07), fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: context.dynamicHeight(0.05)),
                        child: CircleAvatar(
                          backgroundColor: Color(0xffD9D9D9),
                          radius: 80,
                          child: ReusableWidgets.getImageAsset("kupa.png"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: SizedBox(
                                width: context.dynamicWidth(0.4),
                                height: context.dynamicHeight(0.15),
                                child: Card(
                                  color: Color(0xffEAEAEA),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      side: BorderSide(
                                          color: Color(0xffFF5ED2), width: 3)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        widget.score.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            ?.copyWith(
                                                color: Color(0xffFF5ED2),
                                                fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "PUAN",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            ?.copyWith(
                                                color: Color(0xffFF5ED2),
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: SizedBox(
                                width: context.dynamicWidth(0.4),
                                height: context.dynamicHeight(0.15),
                                child: Card(
                                  color: Color(0xffEAEAEA),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      side: BorderSide(
                                          color: Color(0xff00B2FF), width: 3)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "7/10",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            ?.copyWith(
                                                color: Color(0xff00B2FF),
                                                fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "DOĞRU",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            ?.copyWith(
                                                color: Color(0xff00B2FF),
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          height: context.dynamicHeight(0.1),
                          width: context.dynamicWidth(0.8),
                          child: InkWell(
                            onTap: () {},
                            child: Card(
                              color: Color(0xff00B2FF),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  "BİLGİ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          height: context.dynamicHeight(0.1),
                          width: context.dynamicWidth(0.8),
                          child: InkWell(
                            onTap: () {},
                            child: Card(
                              color: Color(0xff26CE55),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  "BİLGİ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  )),
                ],
              ),
            ),
          ),

        ConfettiWidget(
          numberOfParticles: 50,
          blastDirectionality: BlastDirectionality.explosive,
            confettiController: _controllerTopCenter,



        )
      ],
    );
  }


}
