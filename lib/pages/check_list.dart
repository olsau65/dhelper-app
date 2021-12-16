import 'package:flutter/material.dart';

class CheckList extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    String msg1 = '';
    
    msg1 = 'Сейчас у инспекторов ГИБДД нет юридических оснований для проверки техосмотра (наличие диагностической карты) у обычного водителя-физлица.\n\n' +
    'Диагностическую карту инспектор может потребовать у таксистов и у юрлиц.\n\n' +
    'Важно помнить, что:\n\n' +
    '1. Технически исправный автомобиль – это залог вашей безопасности.\n\n' +
    '2. С 01.03.2022 за отсутствие техосмотра грозит штраф 2000 рублей.\n\n' +
    '3. В случае аварии, при отсутствии у вас диагностической карты, страховая компания может применить к вам регресс.';
        
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
                    text: 'Техосмотр\n\n',
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