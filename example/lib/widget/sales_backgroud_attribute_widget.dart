 import 'package:flutter/material.dart';

class SalesBackgroundAttributeWidget extends StatelessWidget {
  final bool isEnglish;

  final String labelKey;

  final String value;
  final Color backgrourdColor;
  final Color textColor;
  final Color valueColor;

  final double topMargin;

  const SalesBackgroundAttributeWidget(
      {Key key,
      this.isEnglish,
      this.labelKey,
      this.value,
      this.backgrourdColor,
      this.textColor,
      this.topMargin,
      this.valueColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgrourdColor ?? Color(0xffccecf0),
          borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      margin: EdgeInsets.symmetric(vertical: topMargin ?? 2),
      child: Row(
        textDirection: isEnglish ? TextDirection.rtl : TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            value ?? "لا يوجد",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: valueColor ?? textColor ?? Color(0xff055664)),
          ),
          Text(
           " مفتاح ",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: textColor ?? Color(0xff055664)),
          ),
        ],
      ),
    );
  }
}
