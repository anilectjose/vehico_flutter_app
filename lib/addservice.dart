import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
import './sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './utilities/constants.dart';
import 'home_screen.dart';
import 'orvba.dart';

class addservices extends StatefulWidget {
  @override
  _addservicesState createState() => _addservicesState();
}

enum LoginStatus { notSignIn, signIn }

class _addservicesState extends State<addservices> {
  var emailCon = new TextEditingController();
  var passCon = new TextEditingController();
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  bool _rememberMe = false;
  String pass, mail;

  getData(String pass, String mail, String _locationMessage) async {
    var url = Orvba.BaseURL + "login.php";

    var credit = {"password": pass, "mailid": mail, "Loca": _locationMessage};

    http.Response res = await http.post(url, body: credit);
    var data = jsonDecode(res.body);
    int value = data['value'];
    String message = data['message'];
    String role = data['rol'];
    String emailAPI = data['mail'];

    data = jsonDecode(res.body);
    String id = data['id'];

    if (role == 'customer') {
      print(message);
      print(emailAPI);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return MyHomePage();
      }));
    } else if (role == 'worker') {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return MyHomePage();
      }));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return MyHomePage();
      }));
/*      print("fail");
      print(message);
      print(role);*/
    }
    if (_rememberMe == true) {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('email', emailCon.text);
      sharedPreferences.setString('role', role);
      sharedPreferences.setString('roleId', id);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget _buildEmailTF1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Company Name',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextField(
            controller: emailCon,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 15.0),
              prefixIcon: Icon(
                Icons.business,
                color: Orvba.themecolor,
              ),
              hintText: 'Enter your Company Name',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailTF2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Location',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextField(
            controller: emailCon,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 15.0),
              prefixIcon: Icon(
                Icons.location_on,
                color: Orvba.themecolor,
              ),
              hintText: 'Enter your Location',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailTF3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Contact',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextField(
            controller: emailCon,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 15.0),
              prefixIcon: Icon(
                Icons.phone,
                color: Orvba.themecolor,
              ),
              hintText: 'Enter your Contact',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailTF4() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Service',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextField(
            controller: emailCon,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 15.0),
              prefixIcon: Icon(
                Icons.build_rounded,
                color: Orvba.themecolor,
              ),
              hintText: 'Enter your Service',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginBtn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          print('Login Button Pressed');
          setState(() {
            pass = passCon.text;
            mail = emailCon.text;
          });
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return MyHomePage();
          }));
          //getData(pass, mail,_locationMessage);
        },
        padding: EdgeInsets.all(12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Orvba.themecolor,
        child: Text(
          'Add',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  String _locationMessage = "";

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: <String, WidgetBuilder>{
            '/signup': (BuildContext context) => new SignUp()
          },
          home: Scaffold(
            body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Stack(
                  children: <Widget>[
                    Container(
                      color: Colors.black,
                    ),
                    Container(
                      height: double.infinity,
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal: 40.0,
                          vertical: 120.0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Add Services',
                              style: TextStyle(
                                color: Orvba.themecolor,
                                fontFamily: 'OpenSans',
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            _buildEmailTF1(),
                            SizedBox(height: 15.0),
                            _buildEmailTF2(),
                            SizedBox(height: 15.0),
                            _buildEmailTF3(),
                            SizedBox(height: 15.0),
                            _buildEmailTF4(),
                            SizedBox(
                              height: 30.0,
                            ),
                            _buildLoginBtn(context),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
        break;

      case LoginStatus.signIn:
        return MyHomePage();
//        return ProfilePage(signOut);
        break;
    }
  }
}
