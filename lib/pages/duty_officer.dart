import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DutyOfficer extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    String msg1, msg2, msg3, msg4 = '';
    
    msg1 = 'Офицер ДПС обязан:\n\n' +
    '1. представиться – сказать свое звание, ФИО, номер жетона\n\n';
    msg2 = 'пп.45,52 Адм.регламента';
    msg3 = 'ст.5 закона О полиции';
    msg4 = '2. назвать причину остановки.\n\n' +
    'Перечень причин для остановки строго регламентирован:\n\n' +
    '•	нарушение ПДД водителем или пассажирами в машине;\n\n' +
    '•	проверка документов у водителя и пассажиров;\n\n' +
    '•	предположение, что данное транспортное средство угнано и находится в розыске;\n\n' +
    '•	предварительная информация, что водитель или пассажиры являются инициаторами аварии или другого противоправного поступка;\n\n' +
    '•	оказание помощи инспектору ГИБДД либо другим участникам дорожного движения;\n\n' +
    '•	необходимость опроса, если водитель или пассажиры были свидетелями ДТП;\n\n' +
    '•	уведомление о запрете дальнейшего движения либо иная информация, относящаяся к безопасности пути;\n\n' +
    'При остановке за нарушение ПДД офицер должен четко указать пункт ПДД, который был нарушен.\n\n' +
    'Важно - по регламенту инспектор имеет право:\n\n' +
    '•	попросить у водителя права, полис ОСАГО или пластик, даже если нарушений не было;\n\n' +
    '•	проверить документы и у пассажиров.';
    
    Column buildOutButton(String label) {

      _launchURL() async {
        String url = '';
        if (label == msg2) {
          url = 'http://www.consultant.ru/document/cons_doc_LAW_280037/66c419ccc3c1b8205260739743cce08ca7b92cb5/';
        } else if (label == msg3) {
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
        buildOutButton(msg2),
        buildOutButton(msg3),
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
                    text: 'Обязанности инспектора\n\n',
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
                  TextSpan(
                    text: msg3 + '\n\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: msg4)
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