import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ViolationsOfficer extends StatelessWidget {
    
  @override
  Widget build(BuildContext context) {

    String msg = '';
    
    msg = 'Нарушения инспекторов ДПС:\n\n' +
    '•	отсутствие нагрудного знака;\n\n' +
    '•	не служебный транспорт;\n\n' +
    '•	сокрытие своего автомобиля из вида -  за кустами, деревьями, домами и пр.;\n\n' +
    '•	отсутствие проблесковых маячков на служебном автомобиле;\n\n' +
    '•	автомобиль ДПС припаркован с нарушениями ПДД;\n\n' +
    '•	инспектор предъявляет не существующие в законе пункты правонарушений;\n\n' +
    '•	чрезмерная агрессия.\n\n' +
    'Водитель имеет право попросить служебное удостоверение и записать данные офицера.\n\n' +
    'Можно узнать номер дежурной части или подразделения и позвонить туда для проверки: точно ли этот сотрудник там служит, действительно ли он сейчас при исполнении и правда ли, что есть ориентировка на такую же машину.\n\n' +
    'Узнавать подразделение ДПС полезно еще и для жалоб. Сам по себе вопрос о месте службы может сделать инспектора вежливее и заставить его внимательнее относиться к правам водителя.';
    
    Column buildOutButton(String label) {

      _launchURL() async {
        String url = '';
        
        if (label == 'п.45, п.52 Адм.регламента') {
          url = 'http://www.consultant.ru/document/cons_doc_LAW_280037/66c419ccc3c1b8205260739743cce08ca7b92cb5/';
        } else if (label == 'ст.5 закона О полиции') {
          url = 'http://www.consultant.ru/document/cons_doc_LAW_110165/50d6a5fc9ad995f3efca10bca062875531f1d30f/';
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
            buildOutButton('п.45, п.52 Адм.регламента'),
            buildOutButton('ст.5 закона О полиции'),
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
                    text: 'Нарушения инспектора\n\n',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  TextSpan(text: msg)
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
          
          Divider(
            color: Colors.black,
          ),

        ],
      ),
    );
  }
}