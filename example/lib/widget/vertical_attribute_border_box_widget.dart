import 'package:flutter/material.dart';

class VerticalAttributeBorderBoxWidget extends StatelessWidget {

  final String labelKey ;
  final String value;

  const VerticalAttributeBorderBoxWidget({Key key, this.labelKey, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return   Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Color(0xff055664),
        ),
      ),
      padding:
      EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      margin: EdgeInsets.symmetric(vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "ltjhp ",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff63a703)),
          ),
          Text(
            value ?? "لا يوجد",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xff055664)),
          ),
        ],
      ),
    );
  }
}
