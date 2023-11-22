import 'package:flutter/material.dart';
import 'package:shared_pref_login_skip_173/screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "";

  @override
  void initState() {
    super.initState();
    getUserName();
  }

  void getUserName() async{
    var prefs = await SharedPreferences.getInstance();
    var userName = prefs.getString(LoginPage.USERNAME_PREF_KEY);
    name = userName!;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name==""? "" : "Welcome, $name", style: TextStyle(fontSize: 25,),),
            SizedBox(
              height: 7,
            ),
            Icon(Icons.home, size: 25, color: Colors.white,),
          ],
        ),
      ),
    );
  }
}
