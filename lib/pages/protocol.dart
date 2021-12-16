import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Protocol extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    String msg1, msg2, msg3, msg4, msg5, msg6 = '';
    
    msg1 = 'При составлении протокола вину должен доказывать инспектор ДПС.\n\n' +
    'У водителя есть право не подписывать протокол и указывать разногласия\n\n';
    msg2 = 'cт.28.1.1 КоАП РФ';
    msg3 = 'ст.28.2 КоАП РФ';
    msg4 = 'Инспектор обязан выслушать объяснения, занести их в протокол и отдать на руки копию\n\n';
    msg5 = 'пп.134,151,168,211 Адм.регламента';
    msg6 = 'Если в протоколе в есть слова «Подпись нарушителя», то слово «нарушителя» следует зачеркнуть и надписать сверху «водителя»\n\n' +
    'Перед подписью лучше написать «не согласен».\n\n' +
    'Чтобы в строчке «свидетели» потом не появились новые ФИО, в пустой графе рекомендуется поставить широкую подпись, чтобы не осталось свободного места.\n\n' +
    'Все сидящие в вашей машине люди – законные свидетели, имеющие полное право присутствовать как при общении с офицером ГИБДД, так и при заполнении протокола.\n\n' +
    'Если в протоколе есть ошибки оформления, например не та дата или данные водителя, об этом можно не писать и потом использовать для полной отмены: неправильно заполненные документы вообще могут не принять в суде, тогда и штраф не назначат.';
    
    Column buildOutButton(String label) {

      _launchURL() async {
        String url = '';
        
        if (label == msg2) {
          url = 'http://www.consultant.ru/document/cons_doc_LAW_34661/777b1cbcecd072d6956dfe3563ec84636919491c/';
        } else if (label == msg3) {
          url = 'http://www.consultant.ru/document/cons_doc_LAW_34661/86eb9da50d2bebf0f8320070bcc298ad5a93d41a/';
        } else if (label == msg5) {
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
          buildOutButton(msg3),
          ],
      ),
    );

    Widget buttonSection2 = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildOutButton(msg5),
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
                    text: 'Протокол\n\n',
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
                  TextSpan(text: msg4),
                  TextSpan(
                    text: msg5 + '\n\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: msg6),
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