import 'dart:async';

import 'package:bmi_app/main.dart';
import 'package:bmi_app/screen_login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class screen_bmi_splash extends StatefulWidget {
  const screen_bmi_splash({super.key});

  @override
  State<screen_bmi_splash> createState() => _screen_bmi_splashState();
}

class _screen_bmi_splashState extends State<screen_bmi_splash> {
  @override
  void initState() {
    super.initState();

    getLoggedStatus();
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
                TextSpan(text: "Know your "),
                TextSpan(
                  text: "BMI",
                  style: TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getLoggedStatus() async {
    var prefs = await SharedPreferences.getInstance();
    bool? isLogged = prefs.getBool("Login");

    Timer(Duration(seconds: 5), () {
      if (isLogged != null) {
        if (isLogged) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => screen_login()),
          );
        }
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => screen_login()),
        );
      }
    });
  }
}
