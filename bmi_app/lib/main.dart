import 'dart:math';

import 'package:bmi_app/screen_login.dart';
import 'package:bmi_app/screen_splash.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
      ),
      home: screen_bmi_splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var controllerWeight = TextEditingController();
  var controllerHeightFt = TextEditingController();
  var controllerHeightIn = TextEditingController();

  var result = "";

  calculateBMI() {
    var intWeight = controllerWeight.text.toString();
    var intHeightFt = controllerHeightFt.text.toString();
    var intHeightIn = controllerHeightIn.text.toString();

    if (intWeight != "" && intHeightFt != "" && intHeightIn != "") {
      var totalHeightIn = int.parse(intHeightFt) * 12 + int.parse(intHeightIn);
      var totalHeightCm = totalHeightIn * 2.54;
      var totalHeightM = totalHeightCm / 100;

      var bmi = int.parse(intWeight) / pow(totalHeightM, 2);

      // BMI logic for comment
      if (bmi > 25) {
        result = "You're Overweight! Your BMI is ${bmi.toStringAsFixed(2)}";
      } else if (bmi < 18) {
        result = "You're Underweight! Your BMI is ${bmi.toStringAsFixed(2)}";
      } else {
        result = "You're Healthy! Your BMI is ${bmi.toStringAsFixed(2)}";
      }

      setState(() {});
    } else {
      setState(() {
        result = "Please fill all the fields to calculate!!!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Know Your BMI',
              style: GoogleFonts.ubuntu(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            InkWell(
              onTap: () async {
                var prefslog = await SharedPreferences.getInstance();
                prefslog.setBool("Login", false);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => screen_login()),
                );
              },
              child: FaIcon(
                FontAwesomeIcons.powerOff,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white54,
        child: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.lilitaOne(fontSize: 35),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'B',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      TextSpan(
                        text: 'ody ',
                        style: TextStyle(color: Colors.black45),
                      ),
                      TextSpan(
                        text: 'M',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      TextSpan(
                        text: 'ass ',
                        style: TextStyle(color: Colors.black45),
                      ),
                      TextSpan(
                        text: 'I',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      TextSpan(
                        text: 'ndex',
                        style: TextStyle(color: Colors.black45),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 80),
                TextField(
                  controller: controllerWeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('Enter your weight (in Kgs)'),
                    prefixIcon: Icon(Icons.line_weight_outlined),
                    prefixIconColor: Theme.of(context).colorScheme.primary,
                    prefixStyle: GoogleFonts.signikaNegative(),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: controllerHeightFt,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('Enter your height (in ft)'),
                    prefixIcon: Icon(Icons.height_outlined),
                    prefixIconColor: Theme.of(context).colorScheme.primary,
                    prefixStyle: GoogleFonts.signikaNegative(),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: controllerHeightIn,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('Enter your height (in inches)'),
                    prefixIcon: Icon(Icons.height_outlined),
                    prefixIconColor: Theme.of(context).colorScheme.primary,
                    prefixStyle: GoogleFonts.signikaNegative(),
                  ),
                ),
                SizedBox(height: 80),
                ElevatedButton(
                  onPressed: () => calculateBMI(),
                  child: Text(
                    'Calculate BMI',
                    style: GoogleFonts.signikaNegative(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  result,
                  style: GoogleFonts.signikaNegative(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
