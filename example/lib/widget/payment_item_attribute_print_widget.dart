import 'package:flutter/material.dart';

class PaymentItemPrintAttributeWidget extends StatelessWidget {
  final bool isEnglish;

  final String payMethod;
  final String amount;
  final String remaining;

  PaymentItemPrintAttributeWidget(
      {Key key, this.isEnglish, this.payMethod, this.amount, this.remaining})
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
                      (payMethod.toLowerCase() == 'gift_card'
                        ?   " رقم البطاقة : "
                        : payMethod.toLowerCase() == 'cc'
                        ?    " رقم التوفيض : "
                        : payMethod.toLowerCase() == 'cheque' ?    " اسم البنك : " :    " الباقى : " )+
                 remaining,
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
                     "  المبلغ : " +amount,
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
                    " طريقة الدفع : "   +" ",
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
