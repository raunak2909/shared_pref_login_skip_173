import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

class LoginPage extends StatelessWidget {
  TextEditingController nameController = TextEditingController();

  static const String LOGIN_PREF_KEY = "isLogin";
  static const String USERNAME_PREF_KEY = "uName";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: nameController,),
            SizedBox(height: 7,),
            ElevatedButton(
              onPressed: () async {

                //if user is successfully logged in
                var prefs = await SharedPreferences.getInstance();
                prefs.setBool(LOGIN_PREF_KEY, true);

                var name = nameController.text.toString();
                prefs.setString(USERNAME_PREF_KEY, name);

                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
