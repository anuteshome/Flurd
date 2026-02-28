import 'package:flurd/pages/LoginPage.dart';
import 'package:flurd/pages/SignUp.dart';
import 'package:flutter/material.dart';

class Signinorsignup extends StatefulWidget {
  const Signinorsignup({super.key});

  @override
  State<Signinorsignup> createState() => _SigninorsignupState();
}

class _SigninorsignupState extends State<Signinorsignup> {
 bool ShowLoginPage =true;

void toggleLogin(){
  setState((){
    ShowLoginPage=!ShowLoginPage;
  });
}

  @override
  Widget build(BuildContext context) {
   if(ShowLoginPage){
    return Loginpage(onTap: toggleLogin,);
   }else{
    return Signup(onTap: toggleLogin,);
   }
  }
}