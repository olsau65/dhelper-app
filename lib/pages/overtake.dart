import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Overtake extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    String msg1, msg2, msg3 = '';
    
    msg1 = 'Если вам вменяют нарушение ПДД связанное с обгоном:\n\n' +
    '•	у инспектора должна быть видеозапись;\n\n' +
    '•	cплошную линию разметки не видно из-за снега или грязи. Тогда обязательно снимите видео, причём так, чтобы по видео можно было определить дату и время съёмки, и что она совпадает со временем привлечения.\n\n' +
    '•	перед сплошной линией разметки обязательно должна быть прерывистая - длиной не менее 50 метров. Сделайте видео замера с возможностью распознать вашу локацию в кадре (номера домов и названия улиц, другие приметные данные).\n\n' +
    'Примечание: Так как за данное нарушение предусмотрен штраф или лишение прав, то любой факт в вашу пользу может смягчить или вовсе избежать наказания.\n\n' +
    'Важно: Инспектор и при отсутствии видеозаписи может составить протокол, но на этот счет есть\n\n';
    msg2 = 'решение ВС РФ';
    msg3 = 'который признал, что протокола недостаточно для привлечения водителей к штрафу или лишению прав – нужные более веские аргументы.';
    
    Column buildOutButton(String label) {

      _launchURL() async {
        String url = '';
        
        if (label == msg2) {
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
                    text: 'Обгон\n\n',
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