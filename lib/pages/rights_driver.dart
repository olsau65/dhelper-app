import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RightsDriver extends StatelessWidget {
    
  @override
  Widget build(BuildContext context) {

    String msg1, msg2, msg3, msg4, msg5, msg6, msg7, msg8, msg9, msg10, msg11, msg12 = '';
    
    msg1 = 'Ваши права при остановке машины инспектором ГИБДД:\n\n' +
    '•	Не выходить из машины, когда остановил инспектор\n\n';
    msg2 = 'п.89 Адм.регламента';
    msg3 = '•	Узнавать причину остановки или ограничения движения\n\n';
    msg4 = 'пп.84,89,91 Адм.регламента';
    msg5 = '•	Объяснить свои действия или отказаться от показаний\n\n';
    msg6 = 'cт.51 Конституции РФ';
    msg7 = 'п.51 Адм.регламента';
    msg8 = '•	Снимать инспектора на камеру\n\n';
    msg9 = 'ст.8 Закона о полиции';
    msg10 = 'Примечание: Иногда запретить съемку все-таки могут. Но для этого нужен документ и основание — например проводится оперативное мероприятие или что-то связано с гостайной.\n\n' +
    'Утверждения автоинспектора не могут приниматься за истину, если его слова не подтверждены другими доказательствами — показаниями понятых, фото и видеоматериалами и т.п.\n\n';
    msg11 = 'решение ВС РФ';
    msg12 = 'п.132 Адм.регламента';
    
    Column buildOutButton(String label) {

      _launchURL() async {
        String url = '';
        if (label == msg6) {
          url = 'http://www.consultant.ru/document/cons_doc_LAW_28399/83e04083255cc765ad2af577efd8db4607b207d5/';
        } else if (label == msg7) {
          url = 'http://www.consultant.ru/document/cons_doc_LAW_280037/66c419ccc3c1b8205260739743cce08ca7b92cb5/';
        } else if (label == msg4) {
          url = 'http://www.consultant.ru/document/cons_doc_LAW_280037/dbbfac1c0ef0ee0b778c4fd5075b18de5d4d3f27/';
        } else if (label == msg12) {
          url = 'http://www.consultant.ru/document/cons_doc_LAW_280037/4afe5bd7c3584f33c86a3799783ea9508560d0ea/';
        } else if (label == msg9) {
          url = 'http://www.consultant.ru/document/cons_doc_LAW_110165/a9c08e29adb629fb145160965279ad2efd397de7/';
        } else if (label == msg11) {
          url = 'http://www.vsrf.ru/press_center/mass_media/26545/';
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
            buildOutButton(msg6),
            buildOutButton(msg7),
            ],
          ),
      );
      
    Widget buttonSection2 = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildOutButton(msg4),
          buildOutButton(msg12),
          ],
        ),
    );

    Widget buttonSection3 = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildOutButton(msg9),
          buildOutButton(msg11),
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
            color: Colors.white,
            child: Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Ваши права\n\n',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  TextSpan(text: msg1),
                  TextSpan(
                    text: msg2 + '\n\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: msg3),
                  TextSpan(
                    text: msg4 + '\n\n',
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
                  TextSpan(
                    text: msg7 + '\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: msg12 + '\n\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: msg8),
                  TextSpan(
                    text: msg9 + '\n\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: msg10),
                  TextSpan(
                    text: msg11 + '\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
          buttonSection3,

          Divider(
            color: Colors.black,
          ),

        ],
      ),
    );
  }
}