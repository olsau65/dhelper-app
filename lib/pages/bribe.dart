import 'package:flutter/material.dart';

class Bribe extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    String msg1 = '';
    
    msg1 = 'Ни в коем случае ничего не предлагайте инспектору в «обмен на его благосклонность».\n\n' +
    'Все разговоры с сотрудниками Госавтоинспекции записываются на портативные видеокамеры. Конечно, основное предназначение этих видеорегистраторов — фиксация нарушений ПДД. Но, также с их помощью можно легко зафиксировать попытку дать взятку должностным лицам.\n\n' +
    'Взяткой будет считаться любой предмет предложенный инспектору в обмен на его бездействие. Сотрудник не имеет права принимать от водителей никаких материальных ценностей, денег и прочих предметов.\n\n' +
    'Правонарушением считается даже попытка дачи взятки должностному лицу. Подобное деяние подпадает под ст. 291 УК РФ, которая предусматривает штраф от 15-кратной до 90-кратной суммы по отношению к взятке, а также лишение свободы сроком до 12 лет.';
        
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
                    text: 'Взятка\n\n',
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