import 'dart:convert';
import 'dart:math';
import 'dart:ui' as ui hide Color;

import 'package:blue_thermal_printer_example/widget/sales_border_attribute_widget.dart';
import 'package:blue_thermal_printer_example/widget/sales_details_attribute_print_widget.dart';
import 'package:blue_thermal_printer_example/widget/sales_item_attribute_print_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Iamge;
import 'package:flutter/rendering.dart';


class SalesDetailsPrintingScreen extends StatelessWidget {
  SalesDetailsPrintingScreen({
    Key key,
  }) : super(key: key);
  GlobalKey<OverRepaintBoundaryState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    bool isEnglish = false;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff00bcd4),
        child: Icon(Icons.print),
        onPressed: () async {
          var renderObject = globalKey.currentContext.findRenderObject();

          RenderRepaintBoundary boundary = renderObject;
          ui.Image captureImage = await boundary.toImage(pixelRatio: 1.5);
       //   var localStorage = SharedPreferenceStorage();
         // var ip = await localStorage.getPrinterIP();
        /*  if (ip != null && ip.isNotEmpty) {
            var res = await controller.printSales(ip.trim(), captureImage);
            if (!res) {

            }
          } else {

          }*/
          // Image thumbnail = uicopyResize(captureImage, width: 120);
        },
      ),
      appBar: AppBar(
        backgroundColor: Color(0xff00bcd4),
        title: Text(
         "طباعة",
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Cairo',
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Capturer(
            overRepaintKey: globalKey,
          ),
        ],
      ),
    );
  }
}

class Capturer extends StatelessWidget {
  static final Random random = Random();

  final GlobalKey<OverRepaintBoundaryState> overRepaintKey;

  Capturer({
    Key key,
    this.overRepaintKey,
  }) : super(key: key);
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: OverRepaintBoundary(
        key: overRepaintKey,
        child: RepaintBoundary(
          child: Column(
            children: List.generate(
              1,
              (i) {
                return Column(
                  children: [
                    Column(
                      children: [
                        SalesPrintAttributeWidget(
                          isEnglish: false,
                        ),
                        SalesPrintAttributeWidget(
                          isEnglish: false,
                        ),
                      ],
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Wrap(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.center,
                            children: [
                              Text(
                                "رفرنس" ,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "التاريخ ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                               "اسم المستخدم",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SalesPrintAttributeWidget(
                      labelKey: ": العميل ",
                      value: "عميل",
                      isEnglish: false,
                    ),

                    SalesItemPrintAttributeWidget(
                      name: "أسم الطلب ",
                      price: "السعر",
                      quantity: "كمية",
                      total: "الإجمالى",

                      tax: " الضريبة ",
                      isEnglish: false,
                    ),
                    Column(
                      children: listOfItems(),
                    ),
                    Column(
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "الاصناف المرتجعة",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Column(
                                  children: listOfItems(),
                                ),
                              ),
                            ],
                          ),
                    SalesDetailsPrintAttributeWidget(
                      isEnglish: false,
                      total: "المجموع",
                      discount: "خصم الاصناف",
                      tax: "نسبة الخصم",
                    ),
                    SalesDetailsPrintAttributeWidget(
                      isEnglish: false,
                      total: "المجموع",
                      discount: "خصم الاصناف",
                      tax: "نسبة الخصم",
                    ),
                    Column(
                      children: [
                        SalesPrintAttributeWidget(
                          isEnglish: false,
                        ),
                        SalesPrintAttributeWidget(
                          isEnglish: false,
                        ),
                      ],
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Wrap(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.center,
                            children: [
                              Text(
                                "رفرنس" ,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "التاريخ ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "اسم المستخدم",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SalesPrintAttributeWidget(
                      labelKey: ": العميل ",
                      value: "عميل",
                      isEnglish: false,
                    ),

                    SalesItemPrintAttributeWidget(
                      name: "أسم الطلب ",
                      price: "السعر",
                      quantity: "كمية",
                      total: "الإجمالى",

                      tax: " الضريبة ",
                      isEnglish: false,
                    ),
                    Column(
                      children: listOfItems(),
                    ),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "الاصناف المرتجعة",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: 8),
                          child: Column(
                            children: listOfItems(),
                          ),
                        ),
                      ],
                    ),
                    SalesDetailsPrintAttributeWidget(
                      isEnglish: false,
                      total: "المجموع",
                      discount: "خصم الاصناف",
                      tax: "نسبة الخصم",
                    ),
                    SalesDetailsPrintAttributeWidget(
                      isEnglish: false,
                      total: "المجموع",
                      discount: "خصم الاصناف",
                      tax: "نسبة الخصم",
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "شكرا لزيارتكم لنا",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> listOfItems( ) {
    List<Widget> list = List();
    for (int i=0 ; i< 2 ;i++) {
      list.add(SalesItemPrintAttributeWidget(
        name: getDisplayedName(),
        price: "السعر",

        tax:  " ريال ",
        quantity: "الكمية",
        total:
            " ريال ",
        isEnglish: false,
      ));
    }
    return list;
  }

  String getDisplayedName( ) {
    String name = "  الاسم";

    return name;
  }


}

class OverRepaintBoundary extends StatefulWidget {
  final Widget child;

  const OverRepaintBoundary({Key key, this.child}) : super(key: key);

  @override
  OverRepaintBoundaryState createState() => OverRepaintBoundaryState();
}

class OverRepaintBoundaryState extends State<OverRepaintBoundary> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
