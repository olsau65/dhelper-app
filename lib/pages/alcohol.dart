import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Alcohol extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    String msg1, msg2, msg3 = '';
    
    msg1 = 'Инспектор может предложить водителю пройти проверку на алкоголь - подышать в трубочку.\n\n' +
    'Водитель может отказаться от такой проверки согласно\n\n';
    msg2 = 'п.234 Адм.регламента';
    msg3 = 'В случае отказа от проверки на месте (алкотестером) - вы пройдете медицинское освидетельствование, то есть сдадите пробы в лаборатории.\n\n' +
    'Такое право может пригодиться, если есть сомнения в точности алкотестера, его поверке и пломбах. Или если инспектор не соблюдает процедуру проверки.\n\n' +
    'Помните: результаты проверки влияют на штрафы, лишение прав, отстранение от управления, выплаты по ОСАГО и потерю работы.\n\n' +
    'Медицинское освидетельствование обычно точнее проверки на алкотестере — пользуйтесь этим правом в спорных ситуациях на дороге.\n\n' +
    'И в любом случае - никогда не садитесь за руль в состоянии опьянения или плохого самочувствия!';
    
    Column buildOutButton(String label) {

      _launchURL() async {
        String url = '';
        
        if (label == msg2) {
          url = 'http://www.consultant.ru/document/cons_doc_LAW_280037/4afe5bd7c3584f33c86a3799783ea9508560d0ea/';
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
                    text: 'Медицинское освидетельствование\n\n',
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