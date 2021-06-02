import 'dart:async';
import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
import './sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './utilities/constants.dart';
import 'fitness_app/fitness_app_home_screen.dart';
import 'home_screen.dart';
import 'orvba.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

enum LoginStatus { notSignIn, signIn }

class _LoginScreenState extends State<LoginScreen> {
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
    } else if(role=='worker'){
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
         return MyHomePage();
       }));
     } else {
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
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

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
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
                Icons.email,
                color: Orvba.themecolor,
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextFormField(
            controller: passCon,
            obscureText: true,
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 15.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Orvba.themecolor,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () {
          print('Forgot Password Button Pressed');
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return LoginScreen();
          }));
          Fluttertoast.showToast(
              msg: "Forget Password clicked", textColor: Colors.black);
        },
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = true;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: kLabelStyle,
          ),
        ],
      ),
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
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
            return FitnessAppHomeScreen();}));
          //getData(pass, mail,_locationMessage);
        },
        padding: EdgeInsets.all(12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Orvba.themecolor,
        child: Text(
          'Sign in',
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

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () {
        print('Sign Up Button Pressed');
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SignUp();
        }));
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
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
                              'Login',
                              style: TextStyle(
                                color: Orvba.themecolor,
                                fontFamily: 'OpenSans',
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            _buildEmailTF(),
                            SizedBox(
                              height: 30.0,
                            ),
                            _buildPasswordTF(),
                            _buildForgotPasswordBtn(),
                            _buildRememberMeCheckbox(),
                            _buildLoginBtn(context),
                            _buildSignupBtn(),
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
