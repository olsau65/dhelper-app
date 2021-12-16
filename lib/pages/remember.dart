import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Remember extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    String msg1, msg2, msg3, msg4, msg5, msg6, msg7, msg8, msg9 = '';
    
    msg1 = 'Забыли водительское удостоверение\n\n' +
    'Если забыли водительское удостоверение, то наказанием в этом случае станет или предупреждение, или штраф в размере 500 рублей:\n\n';
    msg2 = 'ст.12.3 КоАП РФ';
    msg3 = 'Внимание! Согласно\n\n';
    msg4 = 'ст.12.7 КоАП РФ';
    msg5 = '1. Автомобилист, лишенный водительского удостоверения, будет или оштрафован на 30 тыс. рублей, или наказан 15-ю сутками ареста, или обязательные работы на срок от ста до двухсот часов.\n\n' +
    '2. Если за руль сядет человек, который вообще не имеет права управления автомобилем, его накажут штрафом в размере от 5 до 15 тыс. рублей.\n\n' +
    'Забыли ОСАГО\n\n' +
    'Инспектор ГИБДД может проверить полис удаленно с помощью базы РСА, к которой у него есть доступ.\n\n' +
    'Водителя не имеют права штрафовать за отсутствие распечатанного полиса Е–ОСАГО. Вполне достаточно показать инспектору электронную копию документа с экрана смартфона, планшета или ноутбука.\n\n' +
    'Если у вас оформлен обыкновенный полис ОСАГО, но при себе его нет, то вам грозит штраф 500 рублей:\n\n';
    msg6 = 'Если ОСАГО не оформлен, то на первый раз вам выпишут штраф 800 рублей. Кроме того водителям без ОСАГО сейчас начали выписывать предписания устранить нарушение в 10-дневный период.\n\n' +
    'Во второй раз, помимо штрафа, грозят более серьезные санкции вплоть до ареста за неповиновение законному требованию сотрудника полиции.\n\n' +
    'Для управления чужим автомобилем водитель в обязательном порядке должен быть вписан в страховку. В противном случае нарушителя получит штраф 800 рублей.\n\n' +
    'Ошибочные постановления об отсутствии действующего полиса ОСАГО можно будет отменить двумя способами:\n\n' +
    '1. обратиться в свою страховую компанию, которая сама может внести уточнения в базу данных РСА и отменить штраф;\n\n' +
    '2. позвонить на горячую линию РСА +78002002275\n\n' +
    'Забыли СТС\n\n' +
    'Для водителя, который не имеет при себе регистрационных документов на машину предусмотрен штраф в размере 500 рублей:\n\n';
    msg7 = 'Но, помимо этого, инспектор ГИБДД имеет право задержать такой автомобиль, вызвать эвакуатор и отправить машину на штрафстоянку, что указано в\n\n';
    msg8 = 'ст.27.13 КоАП РФ';
    msg9 = 'И автовладелец сможет забрать свой автомобиль оттуда только, если предъявит весь пакет документов. Если автомобилист успеет предъявить инспектору регистрационные документы на свою машину до того, как за ней приедет эвакуатор, то штрафстоянки можно избежать.\n\n' +
    'Обычно сотрудники ГИБДД готовы пойти на встречу рассеянному водителю. Попросите дать вам возможность оставить автомобиль на месте и съездить домой за забытыми документами. \n\n' +
    'Поэтому исходя из вашей ситуации, примите решение что вам выгоднее, например, согласиться со штрафом в 500 рублей или потратиться на такси, чтобы съездить домой за документами.';
    
    Column buildOutButton(String label) {

      _launchURL() async {
        String url = '';
        
        if (label == msg2) {
          url = 'http://www.consultant.ru/document/cons_doc_LAW_34661/0486252c9b58867b61fbeadf42daad5e67b324f1/';
        } else if (label == msg4) {
          url = 'http://www.consultant.ru/document/cons_doc_LAW_34661/86d85d3d522bb77876c524278464db710a481926/';
        } else if (label == msg8) {
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
          buildOutButton(msg8),
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
                    text: 'Забыли документы\n\n',
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
                    text: msg4 + '\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: msg5),
                  TextSpan(
                    text: msg2 + '\n\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: msg6),
                  TextSpan(
                    text: msg2 + '\n\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: msg7),
                  TextSpan(
                    text: msg8 + '\n\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: msg9),
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