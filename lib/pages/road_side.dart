import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RoadSide extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    String msg1, msg2, msg3, msg4, msg5, msg6, msg7 = '';
    
    msg1 = 'Обочина, согласно\n\n';
    msg2 = 'п.1.2 ПДД';
    msg3 = 'это элемент дороги, примыкающий непосредственно к проезжей части на одном уровне с ней, отличающийся типом покрытия или выделенный с помощью разметки.\n\n';
    msg4 = 'п.9.9 ПДД';
    msg5 = 'запрещает движение по обочинам. Исключениями могут пользоваться транспортные средства специальных служб с включёнными сигналами, дорожные службы и автомобили, осуществляющие доставку грузов в места, находящиеся непосредственно на обочине.\n\n' +
    'В остальных случаях обочина может использоваться только для остановки или стоянки транспортных средств, если подобное действие не противоречит дорожным знакам. Жёлтая линия, отделяющая обочину от проезжей части, запрещает остановку и стоянку на всём участке. Пересекать её можно только для вынужденной остановки, предусматривающей последующую установку аварийного знака и включение сигнализации.\n\n';
    msg6 = 'п.8.8 ПДД';
    msg7 = 'косвенно разрешает небольшое движение по обочине. В нем говорится, что если при развороте вне перекрестка ширина проезжей части недостаточна для выполнения маневра из крайнего левого положения, его допускается производить от правого края проезжей части (с правой обочины). При этом водитель должен уступить дорогу попутным и встречным транспортным средствам.\n\n' +
    'Объезжать препятствие по обочине запрещено – за подобные действия водителю могут выписать штраф в размере 1500 рублей. Однако, нюансы ПДД позволяют избежать столь сурового наказания. Для этого при объезде препятствия по обочине нужно выполнить кратковременную остановку, после чего продолжить движение. Формально водитель не нарушит ПДД, поэтому ему не смогут выписать штраф.\n\n' +
    'Если обочина на дороге заасфальтирована, но разметка стёрлась, она перестаёт считаться обочиной. Штраф за движение по ней будет незаконным. Известны случаи, когда водителям выписывали протоколы в подобных ситуациях. Обязательно указывайте на неразличимость разметки в протоколе, что позволит отстоять свои права в будущем.';
    
    Column buildOutButton(String label) {

      _launchURL() async {
        String url = '';
        
        if (label == msg2) {
          url = 'http://www.consultant.ru/document/cons_doc_LAW_2709/5894b193fda5648afe1c1a5e70c028f25cd29099/';
        } else if (label == msg4) {
          url = 'http://www.consultant.ru/document/cons_doc_LAW_2709/d08dbb6ef3956314fd36b1d54a9393598f057acf/';
        } else if (label == msg6) {
          url = 'http://www.consultant.ru/document/cons_doc_LAW_34661/73e48b1d556597db3d88d1648ea0486e7145b1de/';
        }
        
        if (await canLaunch(url)) {
          await launch(url, forceWebView: false);
        } else {
          throw 'Не могу открыть ссылку $url';
        }
      }
      
      return Column(
               
        children: [
          Container(
            
            child: ElevatedButton(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow
                  ),
                ),
                onPressed: _launchURL,
              ),
          ),
        ],
      );
    }

    Widget buttonSection1 = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildOutButton(msg2),
          buildOutButton(msg4),
          ],
      ),
    );

    Widget buttonSection2 = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildOutButton(msg6),
          ],
      ),
    );

    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10.0),
      
      child: Column(
        
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(5.0),
            color: Color(0xffE6E6E6),
            child: Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Движение по обочине\n\n',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  TextSpan(text: msg1),
                  TextSpan(
                    text: msg2 + '\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: msg3),
                  TextSpan(
                    text: msg4 + '\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: msg5),
                  TextSpan(
                    text: msg6 + '\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: msg7),
              ]),
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16.0,
                color: Colors.black
              ),
            ),
          ),

          Divider(
            color: Colors.black,
          ),
                    
          buttonSection1,
          buttonSection2,
          
          Divider(
            color: Colors.black,
          ),

        ],
      ),
    );
  }
}