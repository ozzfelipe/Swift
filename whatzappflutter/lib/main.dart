import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatzappflutter/Home.dart';
import 'package:whatzappflutter/Login.dart';

void main() {

  runApp(MaterialApp(
    home:
    Login(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Color(0xff075E54), accentColor: Color(0xff25D366)),
  ));
}
