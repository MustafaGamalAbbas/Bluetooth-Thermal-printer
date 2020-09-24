import 'package:flutter/material.dart';

class SalesItemPrintAttributeWidget extends StatelessWidget {
  final bool isEnglish;

  final String name;
  final String price;
  final String quantity;
  final String total;
  final bool isTax;

  final String value;
  final String tax;

  SalesItemPrintAttributeWidget(
      {Key key,
      this.isEnglish,
      this.value,
      this.name,
      this.price,
      this.quantity,
      this.total,
      this.isTax=false,
      this.tax})
      : super(key: key);

  final style = TextStyle(
      fontFamily: 'Cairo',
      fontSize: 11,
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
            isTax
                ? VerticalDivider(
                    width: 2,
                    thickness: 1,
                    color: Colors.black,
                  )
                : Container(
                    width: 0.0,
                    height: 0.0,
                  ),
            isTax?
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
            ):Container(
              width: 0.0,
              height: 0.0,
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
                    quantity,
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
                    price,
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
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Center(
                  child: Text(
                    name,
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
