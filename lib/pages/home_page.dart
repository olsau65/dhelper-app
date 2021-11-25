import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hotbot_app1/pages/alcohol.dart';
import 'package:hotbot_app1/pages/belt.dart';
import 'package:hotbot_app1/pages/bribe.dart';
import 'package:hotbot_app1/pages/check_list.dart';
import 'package:hotbot_app1/pages/dirty.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:hotbot_app1/pages/duty_officer.dart';
import 'package:hotbot_app1/pages/inspection.dart';
import 'package:hotbot_app1/pages/insurance.dart';
import 'package:hotbot_app1/pages/overtake.dart';
import 'package:hotbot_app1/pages/pedestrian.dart';
import 'package:hotbot_app1/pages/protocol.dart';
import 'package:hotbot_app1/pages/remember.dart';
import 'package:hotbot_app1/pages/rights_driver.dart';
import 'package:hotbot_app1/pages/road_side.dart';
import 'package:hotbot_app1/pages/screening.dart';
import 'package:hotbot_app1/pages/speed.dart';
import 'package:hotbot_app1/pages/tint.dart';
import 'package:hotbot_app1/pages/violations_officer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String scene = '';
  
  final controller = ScrollController();

  final whiteTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 24,
  );

  @override
  void initState() {
    super.initState();
    // controller.addListener(() {
    //   print('$controller.offset');
    // });
  }

  Widget build(BuildContext context) {
    Column buildButtonColumn(String label) {
      void printFirst() {
        // print(label);
        setState(() {
          scene = label;
          controller.jumpTo(0);
        });
      }

      Color color = Theme.of(context).primaryColor;

      return Column(
        
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15.0),
            padding: const EdgeInsets.all(0.0),
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(
                color: Colors.black,
                blurRadius: 10.0,
                offset: Offset(1.0, 1.0),
              ),
              ],
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(colors: [
                Color(0xFF5337ff),
                Color(0xFF8131ff),
                Color(0xFFbd27ff),
              ])
            ),
            child: TextButton(
              onPressed: printFirst,
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  
                ),
                textAlign: TextAlign.center,
              ),
            )
          ),
        ],
      );
    }

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Я помогу разобраться в ситуации',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Что вас интересует?',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Widget buttonSection1 = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn('Обязанности инспектора'),
          buildButtonColumn('Ваши права'),
        ],
        
      ),
    );

    Widget buttonSection2 = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn('Нарушения инспектора'),
          buildButtonColumn('Протокол'),
        ],
        
      ),
    );

    Widget buttonSection3 = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn('Обгон'),
          buildButtonColumn('Скорость'),
          buildButtonColumn('Пешеход'),
        ],
        
      ),
    );

    Widget buttonSection4 = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn('Алкоголь'),
          buildButtonColumn('Тонировка'),
          buildButtonColumn('Ремень'),
        ],
        
      ),
    );

    Widget buttonSection5 = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn('Техосмотр'),
          buildButtonColumn('ОСАГО'),
          buildButtonColumn('Взятка'),
        ],
        
      ),
    );

    Widget buttonSection6 = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn('Осмотр'),
          buildButtonColumn('Досмотр'),
          buildButtonColumn('Обочина'),
        ],
        
      ),
    );

    Widget buttonSection7 = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn('Забыли документы'),
          buildButtonColumn('Грязный знак'),
        ],
        
      ),
    );

    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      appBar: AppBar(
        title: Text(
          'Володя, помоги! Остановили ДПС',
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
              color: Colors.red,
                
          ),
        )
      ),
      body: ListView(
        controller: controller,
        children: [
          titleSection,
          
          scene == ''
          ? Image.asset(
            'assets/images/logo.png',
            height: 150.0,
            fit: BoxFit.contain,
          )
          : scene == 'Обязанности инспектора'
          ? DutyOfficer()
          : scene == 'Ваши права'
          ? RightsDriver()
          : scene == 'Нарушения инспектора'
          ? ViolationsOfficer()
          : scene == 'Протокол'
          ? Protocol()
          : scene == 'Обгон'
          ? Overtake()
          : scene == 'Скорость'
          ? Speed()
          : scene == 'Пешеход'
          ? Pedestrian()
          : scene == 'Алкоголь'
          ? Alcohol()
          : scene == 'Тонировка'
          ? Tint()
          : scene == 'Ремень'
          ? Belt()
          : scene == 'Техосмотр'
          ? CheckList()
          : scene == 'ОСАГО'
          ? Insurance()
          : scene == 'Взятка'
          ? Bribe()
          : scene == 'Осмотр'
          ? Screening()
          : scene == 'Досмотр'
          ? Inspection()
          : scene == 'Обочина'
          ? RoadSide()
          : scene == 'Забыли документы'
          ? Remember()
          : scene == 'Грязный знак'
          ? Dirty()
          : Padding(padding: EdgeInsets.zero),
                    
          buttonSection1,
          buttonSection2,
          buttonSection3,
          buttonSection4,
          buttonSection5,
          buttonSection6,
          buttonSection7,

          Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
