import 'package:flutter/material.dart';
import 'package:test_ceiba_software/src/pages/home_page.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        // ignore: prefer_const_constructors
        '/':(context) => const HomePage(),
        //'/userDetails':(context) =>   UserDetails(),
      }
    );
  }
}
