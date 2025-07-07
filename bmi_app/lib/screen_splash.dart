import 'dart:async';

import 'package:bmi_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class screen_bmi_splash extends StatefulWidget {

  @override
  State<screen_bmi_splash> createState() => _screen_bmi_splashState();
}

class _screen_bmi_splashState extends State<screen_bmi_splash> {

  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 5), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(),
            )
        );
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Center(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 45,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "Know your ",
                ),
                TextSpan(
                  text: "BMI",
                  style: TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                  )
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}