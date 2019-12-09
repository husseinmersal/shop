import 'package:flutter/material.dart';
import 'package:shop/Tools/app_data.dart';
import 'package:shop/Tools/app_methods.dart';
import 'package:shop/Tools/app_tools.dart';
import 'package:shop/Tools/firebase_methods.dart';
import 'package:shop/UserScreens/signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final scaffoldKey=GlobalKey<ScaffoldState>();
  BuildContext context;
  AppMethods appMethods = FirebaseMethods();
  @override
  Widget build(BuildContext context) {
    this.context=context;
    return Scaffold(
      backgroundColor: Colors.red[300],
      //================ scaffoldKey ============================
      key: scaffoldKey,
      //backgroundColor: Colors.red[300],
      //=================App Bar=================================
      appBar: AppBar(
        title: Text('Login'),
        //centerTitle: true,
        elevation: 1.0,
        backgroundColor: Colors.red[300],
      ),
      //=================Body====================================
      body:  SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                ),
                AppTextField(
                    isPassword: false,
                    sidePadding: 18.0,
                    textHint: "Email Address",
                    textIcon: Icons.email,
                    textType: TextInputType.emailAddress,
                    controller: email,
                    FieldLength: 50),
                SizedBox(
                  height: 30.0,
                ),
                AppTextField(
                    isPassword: true,
                    sidePadding: 18.0,
                    textHint: "Password",
                    textIcon: Icons.lock,
                    textType: TextInputType.visiblePassword,
                    controller: password,
                    FieldLength: 15),
                SizedBox(
                  height: 40.0,
                ),
                AppButton(
                    btnTxt: "Login",onbtnclicked: verifyLogin,
                    btnPadding: 120.0,
                    btnTxtColor: Colors.white,
                    btnBackColor: Colors.black38),
                SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUp())),
                  child: Text(
                    "Not Registered? Sign Up Here",
                    style:
                        TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
    );
  }
  //================ verifyLogin ========================================
  verifyLogin() async {
    if(email.text == ""){
      showSnackBar("Email Can't be empty :(",scaffoldKey);
      return;
    }else if(password.text=="")
    {
      showSnackBar("Password Can't be empty :(",scaffoldKey);
      return;
    }
  displayProgressDialog(context);
   bool response = await appMethods.LoginUser(email: email.text.toLowerCase(),password: password.text.toLowerCase());

   if(response == true){
     closeProgressDialog(context);
     Navigator.of(context).pop(true);
   }else{
     closeProgressDialog(context);
     showSnackBar("Email Or Password may be not Correct", scaffoldKey);
   }
  }
}




















