import 'package:flutter/material.dart';

class SalesDetailsPrintAttributeWidget extends StatelessWidget {
  final bool isEnglish;

  final String tax;
  final String discount;
  final String total;


  SalesDetailsPrintAttributeWidget(
      {Key key,
      this.isEnglish,

      this.total, this.tax, this.discount})
      : super(key: key);

  final style = TextStyle(
      fontFamily: 'Cairo',
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Center(
                  child: Text(
                    total,
                    textAlign: TextAlign.end,
                    style: style,
                  ),
                ),
              ),
            ),

            VerticalDivider(
              width: 2,
              thickness: 1,
              color: Colors.black,
            ),

            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Center(
                  child: Text(
                    discount,
                    textAlign: TextAlign.end,
                    style: style,
                  ),
                ),
              ),
            ),
            VerticalDivider(
              width: 2,
              thickness: 1,
              color: Colors.black,
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Center(
                  child: Text(
                    tax,
                    textAlign: TextAlign.end,
                    style: style,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
