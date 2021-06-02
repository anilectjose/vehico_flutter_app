import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './utilities/constants.dart';
import './login_page.dart';
import 'orvba.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _rememberMe = false;
  var nameCon= new TextEditingController();
  var passCon= new TextEditingController();
  var mobCon= new TextEditingController();
  var emailCon= new TextEditingController();

  String name,pass,phone,mail,RolE='false';
  SaveData(String name, String pass, String phone, String mail) async{
    if (_rememberMe == true) {
      RolE='true';
    }
    var url = Orvba.BaseURL+"regi.php";

    var data = {"names":name,"password":pass,"phonen":phone, "mailid":mail, "roleee":RolE};
    var res = await http.post(url,body: data);
  }

  Widget _buildUserTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Username',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextField(
            textCapitalization: TextCapitalization.words,
            controller: nameCon,
            keyboardType: TextInputType.name,
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 15.0),
              prefixIcon: Icon(
                Icons.person,
                color: Orvba.themecolor,
              ),
              hintText: 'Enter Username',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
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
              color: Colors.black87,
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

  Widget _buildNumberTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Mobile Number',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextField(
            controller: mobCon,
            keyboardType: TextInputType.phone,
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 15.0),
              prefixIcon: Icon(
                Icons.local_phone,
                color: Orvba.themecolor,
              ),
              hintText: 'Enter your Number',
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
          child: TextField(
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
            'Are you like to be a Mechanic ?',
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
        onPressed: () {
          print('Account Created');
          setState((){
            name= nameCon.text;
            pass= passCon.text;
            phone= mobCon.text;
            mail= emailCon.text;
          }
          );
          SaveData(name,pass,phone,mail);
          Fluttertoast.showToast(
              msg: "Account created",
              textColor: Colors.black
          );
        },
        padding: EdgeInsets.all(12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Orvba.themecolor,
        child: Text(
          'CREATE ACCOUNT',
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
        print('Sign In Button Pressed');
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return LoginScreen();
        }));
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign In',
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String,WidgetBuilder>{
        '/loginpage':(BuildContext context)=>new LoginScreen()
      },
      home: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: <Widget>[
                Container(
                  color:Colors.black
                ),
                Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 80.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Orvba.themecolor,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30.0),
                        _buildUserTF(),
                        SizedBox(height: 10.0,),
                        _buildEmailTF(),
                        SizedBox(height: 10.0,),
                        _buildNumberTF(),
                        SizedBox(height: 10.0,),
                        _buildPasswordTF(),
                        SizedBox(height: 10.0,),
                        _buildRememberMeCheckbox(),
                        SizedBox(height: 30.0,),
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
  }
}
