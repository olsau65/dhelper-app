import 'package:flutter/material.dart';

class Dirty extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    String msg1 = '';
    
    msg1 = '•	Номер считается нечитаемым, если днем с 20 метров невозможно распознать хотя бы один символ переднего и заднего номера.\n\n' +
    '•	Ночью проверяется только задний номер.\n\n' +
    '•	Штраф за нечитаемые номера — 500 рублей, если у водителя не было цели специально скрывать номера за слоем грязи.\n\n' +
    '•	Если будет доказано, что водитель скрыл номер специально - штраф 5000 рублей или лишение прав до 3 месяцев.\n\n' +
    '•	Обжаловать можно, если предоставить в доказательство невиновности видеозапись с причиной грязи на номере. Это могут быть: погодные условия, коммунальная авария или вынужденное пересечение грязного участка грунтовой дороги.\n\n' +
    'Если ни с вашей стороны, ни со стороны офицера ДПС нет других "скрытых" целей, то обычно достаточно протереть номер.';
        
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
                    text: 'Грязные номерные знаки\n\n',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  TextSpan(text: msg1),
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
        ],
      ),
    );
  }
}