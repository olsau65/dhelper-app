import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Pedestrian extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    String msg1, msg2, msg3, msg4, msg5, msg6, msg8, msg9, msg10, msg11, msg12, msg13, msg14, msg15, msg16 = '';
    
    msg1 = 'Сегодня в\n\n';
    msg2 = 'п.14.1 ПДД';
    msg4 = 'нет термина "пропустить пешеходов", есть термин "уступить дорогу".\n\n' +
    'Термин "уступить дорогу" описан в\n\n';
    msg5 = 'п.1 ПДД';
    msg6 = 'и означает "не создавать помех". Т.е. ваш маневр не должен вынуждать пешехода изменить направление движения или скорость.\n\n' +
    'Вы ничего не нарушили, если:\n\n' +
    '•	Проехали, не создав помех пешеходу, когда тот переходил дорогу далеко от Вас на другой стороне дороги.\n\n' +
    '•	Пропустили пешехода и проехали у него за спиной до того как он полностью закончил переход.\n\n' +
    '•	Пешеход изменил траекторию и/или скорость движения по своей инициативе.\n\n' +
    'Если у Вас есть видеорегистратор, запись с которого может подтвердить отсутствие созданной пешеходу помехи и выполнение\n\n';
    msg8 = 'сообщите инспектору о наличии у Вас регистратора и намерении обжаловать штраф.\n\n' +
    'Если у вас нет видеорегистратора, то будет сложнее, но:\n\n' +
    '•	инспектор обязан всесторонне рассматривать дело об административном нарушении\n\n';
    msg9 = 'ст.26.11 КоАП';
    msg10 = 'а это значит, что он при наличии возможности обязан привлечь самого пешехода как свидетеля.\n\n' +
    '•	можно напомнить инспектору о\n\n';
    msg11 = 'решение ВС РФ';
    msg12 = ' что одного протокола о нарушении недостаточно и от инспектора нужны доказательства (видео, свидетели и т.д.).\n\n' +
    'По новым правилам 2021 года инспектор вправе сразу выписать постановление. А если Вы с нарушением не согласны, то он обязан составить протокол. В нём и укажите нарушения инспектора.\n\n' +
    'Если инспектор не разъяснил Вам\n\n';
    msg13 = 'ст.51 Конституции';
    msg14 = 'что никто не обязан свидетельствовать против себя и ближайших родственников, а также\n\n';
    msg15 = 'ст.25.1 КоАП';
    msg16 = 'о праве знакомиться с материалами дела, то укажите это в протоколе.\n\n' +
    'Если инспектор отказывается составлять протокол, то можете указать на это в постановлении.';
       
    Column buildOutButton(String label) {

      _launchURL() async {
        String url = '';
        
        if (label == msg2) {
          url = 'http://www.consultant.ru/document/cons_doc_LAW_2709/7c45508e360f5b7b8ae1443d73feb01f52a6199d/';
        } else if (label == msg5) {
          url = 'http://www.consultant.ru/document/cons_doc_LAW_2709/5894b193fda5648afe1c1a5e70c028f25cd29099/';
        } else if (label == msg9) {
          url = 'http://www.consultant.ru/cons/cgi/online.cgi?from=310131-11637&req=doc&rnd=C3C6E808E7EB69228BE01CF386778992&base=LAW&n=388938&stat=srcfld%3D134%26src%3D1000000001%26fld%3D134%26code%3D65535%26page%3Dinfo%26p%3D0%26base%3DLAW%26doc%3D310131#B8vmdgSC6G9HWxoP1';
        } else if (label == msg11) {
          url = 'http://www.vsrf.ru/press_center/mass_media/26545/';
        } else if (label == msg13) {
          url = 'http://www.consultant.ru/document/cons_doc_LAW_28399/83e04083255cc765ad2af577efd8db4607b207d5/';
        } else if (label == msg15) {
          url = 'http://www.consultant.ru/cons/cgi/online.cgi?from=310131-11395&req=doc&rnd=C3C6E808E7EB69228BE01CF386778992&base=LAW&n=388938&stat=srcfld%3D134%26src%3D1000000001%26fld%3D134%26code%3D65535%26page%3Dinfo%26p%3D0%26base%3DLAW%26doc%3D310131#QsZmdgSiHgvwPNxj';
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
          buildOutButton(msg5),
          ],
      ),
    );

    Widget buttonSection2 = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildOutButton(msg9),
          buildOutButton(msg11),
          ],
      ),
    );
    
    Widget buttonSection3 = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildOutButton(msg13),
          buildOutButton(msg15),
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
                    text: 'Не уступил дорогу пешеходу\n\n',
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
                  TextSpan(text: msg4),
                  TextSpan(
                    text: msg5 + '\n\n',
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
                  TextSpan(text: msg8),
                  TextSpan(
                    text: msg9 + '\n\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: msg10),
                  TextSpan(
                    text: msg11 + '\n\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: msg12),
                  TextSpan(
                    text: msg13 + '\n\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: msg14),
                  TextSpan(
                    text: msg15 + '\n\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: msg16)
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