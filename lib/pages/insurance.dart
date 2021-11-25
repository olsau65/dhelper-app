import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Insurance extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    String msg1, msg2, msg3 = '';
    
    msg1 = 'Инспектор ГИБДД может проверить полис удаленно с помощью базы РСА, к которой у него есть доступ.\n\n' +
    'Водителя не имеют права штрафовать за отсутствие распечатанного полиса Е–ОСАГО. Вполне достаточно показать инспектору электронную копию документа с экрана смартфона, планшета или ноутбука.\n\n' +
    'Если у вас оформлен обыкновенный полис ОСАГО, но при себе его нет, то вам грозит штраф 500 рублей\n\n';
    msg2 = 'ст.12.3 КоАП часть 2';
    msg3 = 'Если ОСАГО не оформлен, то на первый раз вам выпишут штраф 800 рублей. Кроме того водителям без ОСАГО сейчас начали выписывать предписания устранить нарушение в 10-дневный период.\n\n' +
    'Во второй раз, помимо штрафа, грозят более серьезные санкции вплоть до ареста за неповиновение законному требованию сотрудника полиции.\n\n' +
    'Для управления чужим автомобилем водитель в обязательном порядке должен быть вписан в страховку. В противном случае нарушителя получит штраф 800 рублей.\n\n' +
    'Ошибочные постановления об отсутствии действующего полиса ОСАГО можно будет отменить двумя способами:\n\n' +
    '1. обратиться в свою страховую компанию, которая сама может внести уточнения в базу данных РСА и отменить штраф;\n\n' +
    '2. позвонить на горячую линию РСА +78002002275';
    
    Column buildOutButton(String label) {

      _launchURL() async {
        String url = '';
        
        if (label == msg2) {
          url = 'http://www.consultant.ru/document/cons_doc_LAW_34661/0486252c9b58867b61fbeadf42daad5e67b324f1/';
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
            color: Colors.white,
            child: Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'ОСАГО\n\n',
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