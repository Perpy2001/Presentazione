//Social bus
import 'package:flutter/material.dart';
import 'package:prova/pages/home.dart';
import 'package:prova/pages/wrapper.dart';
import 'package:prova/pages/login_register.dart';

void main() => runApp(MaterialApp(
      title: 'Custom Fonts',
      // Set Raleway as the default app font.
      theme: ThemeData(
        fontFamily: 'Comfortaa',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Wrapper(),
        '/home': (context) => Home(),
        '/login': (context) => Login(),
        '/registration': (context) => Registration(),
      },
    ));
