
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerticalAttributeBox extends StatelessWidget {
  final String labelKey ;
  final String value ;
  final Color color ;

  const VerticalAttributeBox({Key key, this.labelKey, this.value, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(4),
      width: MediaQuery.of(context).size.width * 0.25,
      height: MediaQuery.of(context).size.width * 0.25,
      constraints: BoxConstraints(
        maxWidth: 150,
        maxHeight: 150,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(

              padding: EdgeInsets.symmetric(vertical: 6),
              width: double.infinity  ,
              decoration: BoxDecoration(
                  color: Color(0xff055664),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      topLeft: Radius.circular(8))),
              child: Text(
                "متاح",
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
          Expanded(
            child: Container(
              alignment: Alignment.center,
                width: double.infinity  ,
                padding: EdgeInsets.symmetric(vertical:2 , horizontal: 2),
                decoration: BoxDecoration(
                    color:  color?? Colors.orange,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8))),
                child: Text(
                 value ?? "لا يوجد",
                  textAlign: TextAlign.center,
                  maxLines: 1,

                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
