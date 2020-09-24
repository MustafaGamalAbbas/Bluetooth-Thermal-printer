
import 'package:flutter/material.dart';

class SalesPrintAttributeWidget extends StatelessWidget {
  final bool isEnglish;

  final String labelKey;

  final String value;

  const SalesPrintAttributeWidget(
      {Key key, this.isEnglish, this.labelKey, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "قيمة",
            maxLines: 1,
          //  minFontSize: 12,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text("مفتاح",
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
      ],
    );
  }
}
