import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'orvba.dart';
import 'home_screen.dart';
import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

var finalEmail;
var finalRole;
var finalRoleID;

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    getValidationData().whenComplete(() async {
      if (finalRole == 'customer') {
        Timer(
            Duration(seconds: 100),
            () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return MyHomePage();
                })));
      } else {
        Timer(
            Duration(seconds: 1),
            () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                })));
      }
    });
    super.initState();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainEmail = sharedPreferences.getString('email');
    var obtainRole = sharedPreferences.getString('role');
    var obtainRoleid = sharedPreferences.getString('roleId');
    setState(() {
      finalEmail = obtainEmail;
      finalRole = obtainRole;
      finalRoleID = obtainRoleid;
    });
    print(finalEmail);
    print(finalRole);
    print(finalRoleID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // CircleAvatar(
                          //     backgroundColor: Colors.white,
                          //     radius: 50.0,
                          //     child: Image.asset('assets/logos/logo.png')),
                          Padding(
                            padding: EdgeInsets.only(top: 15.0),
                          ),
                          Text(
                            Orvba.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                        ),
                        Text(
                          Orvba.Desc,
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.red),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
