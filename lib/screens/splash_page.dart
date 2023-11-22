import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_pref_login_skip_173/screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () async{

      var prefs = await SharedPreferences.getInstance();

      bool? checkLogin = prefs.getBool(LoginPage.LOGIN_PREF_KEY);

      Widget navigateTo = LoginPage();


      if(checkLogin!=null && checkLogin){
        navigateTo = HomePage();
      }

      /*if(checkLogin==null){
        //login
        navigateTo = LoginPage();
      } else {
        if(checkLogin){
          //home
          navigateTo = HomePage();
        } else {
          //login
          navigateTo = LoginPage();
        }
      }*/

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => navigateTo,
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.ac_unit_outlined,
            size: 34,
            color: Colors.white,
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            "Classico",
            style: TextStyle(fontSize: 25, color: Colors.white),
          )
        ],
      ),
    );
  }
}
