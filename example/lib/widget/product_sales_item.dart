
import 'package:blue_thermal_printer_example/widget/sales_backgroud_attribute_widget.dart';
import 'package:blue_thermal_printer_example/widget/vertical_attribute_border_box_widget.dart';
import 'package:flutter/material.dart';

class ProductSalesItem extends StatelessWidget {
  final bool isEnglish;


  const ProductSalesItem({Key key, this.isEnglish = false, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xff0e8fa6))),
      child: Column(
        children: <Widget>[
          VerticalAttributeBorderBoxWidget(
            labelKey: "subject",
            value: "موضوع",
          ),
          SalesBackgroundAttributeWidget(
            isEnglish: isEnglish,
            labelKey: "code_without_colun",
            value: "كود",
          ),
          SalesBackgroundAttributeWidget(
            isEnglish: isEnglish,
            labelKey: "quantity",
            value: "شسي",
          ),
          SalesBackgroundAttributeWidget(
            isEnglish: isEnglish,
            labelKey: "unit_price",
            value: "تهتننتن",
          ),
          SalesBackgroundAttributeWidget(
            isEnglish: isEnglish,
            labelKey: "grandTotal",
            value: "كالسيب",
          )
        ],
      ),
    );
  }
}
