import 'package:flutter/material.dart';

class Speed extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    String msg1 = '';
    
    msg1 = 'Инспектор должен предъявить радар, на котором вы должны четко увидеть, что:\n\n' +
    '•	Скорость фиксировалась именно по вашему автомобилю, а не по другому - в соседней полосе, перед или за вами;\n\n' +
    '•	Скорость фиксировалась именно сейчас, а не в заведомо прошлый период.\n\n' +
    'Если есть сомнения в радаре, вы вправе попросить документы на него с отметками:\n\n' +
    'такие приборы должны проходить периодическую поверку - дата поверки не должна быть просрочена.';
        
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
                    text: 'Нарушение скоростного режима\n\n',
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