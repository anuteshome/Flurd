import 'package:flurd/pages/LoginPage.dart';
import 'package:flurd/pages/SigninOrSignup.dart';
import 'package:flurd/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authpageflurd extends StatefulWidget {
  const Authpageflurd({super.key});

  @override
  State<Authpageflurd> createState() => _AuthpageflurdState();
}

class _AuthpageflurdState extends State<Authpageflurd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context,snapshot){
          if(snapshot.hasData){
            return Homepage();
          }else{
            return Signinorsignup();
          }
        }),
    );
  }
}