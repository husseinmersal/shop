import 'package:flutter/material.dart';
import 'package:shop/Tools/app_methods.dart';
import 'package:shop/Tools/app_tools.dart';
import 'package:shop/Tools/firebase_methods.dart';
import 'package:shop/UserScreens/login.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController fullname = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController re_password = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  BuildContext context;
  AppMethods appMethods = FirebaseMethods();

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      //================ scaffoldKey ============================
      key: scaffoldKey,
      backgroundColor: Colors.red[300],
      //=================App Bar=================================
      appBar: AppBar(
        title: Text('Sign Up'),
        //centerTitle: true,
        elevation: 1.0,
        backgroundColor: Colors.red[300],
      ),
      //=================Body====================================
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            AppTextField(
                isPassword: false,
                sidePadding: 18.0,
                textHint: "Full Name",
                textIcon: Icons.person,
                textType: TextInputType.text,
                controller: fullname,
                FieldLength: 50),
            SizedBox(
              height: 30.0,
            ),
            AppTextField(
                isPassword: false,
                sidePadding: 18.0,
                textHint: "Phone Number",
                textIcon: Icons.phone,
                textType: TextInputType.phone,
                controller: phoneNumber,
                FieldLength: 11),
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
              height: 30.0,
            ),
            AppTextField(
                isPassword: true,
                sidePadding: 18.0,
                textHint: "Re-Password",
                textIcon: Icons.lock,
                textType: TextInputType.visiblePassword,
                controller: re_password,
                FieldLength: 15),
            SizedBox(
              height: 40.0,
            ),
            AppButton(
                btnTxt: "Create Account",
                onbtnclicked: verifyDetails,
                btnPadding: 100.0,
                btnTxtColor: Colors.white,
                btnBackColor: Colors.black38),
            SizedBox(
              height: 10.0,
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Login(),
                ),
              ),
              child: Text(
                "Are You Registered? Login Here",
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
  verifyDetails() async {
    if (fullname.text == "") {
      showSnackBar("Full Name Can't be empty :(", scaffoldKey);
      return;
    } else if (phoneNumber.text == "") {
      showSnackBar("Phone Number Can't be empty :(", scaffoldKey);
      return;
    } else if (email.text == "") {
      showSnackBar("Email Can't be empty :(", scaffoldKey);
      return;
    } else if (password.text == "") {
      showSnackBar("Password Can't be empty :(", scaffoldKey);
      return;
    } else if (re_password.text == "") {
      showSnackBar("Re_password Can't be empty :(", scaffoldKey);
      return;
    }
    if (re_password.text != password.text) {
      showSnackBar(
          "Re-Password doesn't match !! Please try again...", scaffoldKey);
      return;
    }
    displayProgressDialog(context);
    bool response =await appMethods.CreateUserAccount(
        fullname: fullname.text,
        phone: phoneNumber.text,
        email: email.text.toLowerCase(),
        password: password.text.toLowerCase());

    if(response == true){
      closeProgressDialog(context);
      Navigator.of(context).pop();
      Navigator.of(context).pop(true);
    }else{
      closeProgressDialog(context);
      showSnackBar("Error Occurred", scaffoldKey);
    }
  }
}




















