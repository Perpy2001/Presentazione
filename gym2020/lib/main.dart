import 'package:flutter/material.dart';
import 'package:gym2020/pages/crono.dart';
import 'package:gym2020/pages/home.dart';

void main() => runApp(MaterialApp(initialRoute: '/', routes: {
      '/': (context) => Home(),
      '/Crono': (context) => CronoPage(),
    }));
