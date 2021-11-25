import 'package:flutter/material.dart';

class Belt extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    String msg1 = '';
    
    msg1 = '•	Факт нарушения инспектор должен доказать предъявив видеозапись или свидетелей.\n\n' +
    '•	Если вы, разговаривая с инспектором, сидите в припаркованном автомобиле с непристегнутым ремнем - это не нарушение.\n\n' +
    '•	Если нет видеозаписи нарушения и свидетелей, достаточно сказать "Я отстегнул ремень, пока вы шли к моему автомобилю".\n\n' +
    'И все же - всегда пристегивайте ремень перед началом движения - это может спасти вам жизнь!';
        
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
                    text: 'Непристегнутый ремень\n\n',
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