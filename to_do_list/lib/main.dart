import 'package:flutter/material.dart';
import 'package:to_do_list/activities/home.dart';
import 'package:to_do_list/activities/main_screen.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context) => MainScreen(),
        '/todo':(context) => Home(),
      },
    ));
