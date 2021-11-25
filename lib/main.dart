import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import 'package:google_fonts/google_fonts.dart';
import 'package:hotbot_app1/pages/home_page.dart';

void main() {
  debugPaintSizeEnabled = false;
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Автоюрист Володя',
      // убираем баннер
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: GoogleFonts.openSansCondensedTextTheme(
          Theme.of(context).textTheme,
        ),
        // textTheme: TextTheme(
        //   caption: TextStyle(fontSize: 22.0, color: Colors.white),
        // ),
        // fontFamily: 'Roboto',
      ),
      home: HomePage(),
    );
  }
}
