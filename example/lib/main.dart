import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:blue_thermal_printer_example/sales_details_printing_screen.dart';
import 'package:blue_thermal_printer_example/testprint.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

  List<BluetoothDevice> _devices = [];
  BluetoothDevice _device;
  bool _connected = false;
  String pathImage;
  String arabic2pathImage;
  String arabic3pathImage;
  String pathImageLOGO;
  TestPrint testPrint;
  ByteData bytesLOGO;
  var displayedImage;

  ByteData bytes;
  ByteData arabic2bytes;
  ByteData arabic3bytes;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    initSavetoPath();
    testPrint = TestPrint();
  }

  initSavetoPath() async {
    //read and write
    //image max 300px X 300px

    /* final arabic2 = 'arabic2.png';
    arabic2bytes = await rootBundle.load("assets/arabic2.png");
    String arabic2bytesdirLOGO =
        (await getApplicationDocumentsDirectory()).path;
    writeToFile(bytesLOGO, '$arabic2bytesdirLOGO/$arabic2');

    final arabic3 = 'arabic3.png';
    arabic3bytes = await rootBundle.load("assets/arabic3.png");
    String arabic3bytesdirLOGO =
        (await getApplicationDocumentsDirectory()).path;
    writeToFile(bytesLOGO, '$arabic3bytesdirLOGO/$arabic3');

    setState(() {
      arabic2pathImage = '$arabic2bytesdirLOGO/$arabic2';
      arabic3pathImage = '$arabic3bytesdirLOGO/$arabic3';

      // pathImageLOGO = '$dirLOGO/$filenameLOGO';
    });*/
  }

  Future<void> initPlatformState() async {
    bool isConnected = await bluetooth.isConnected;
    List<BluetoothDevice> devices = [];
    try {
      devices = await bluetooth.getBondedDevices();
    } on PlatformException {
      // TODO - Error
    }

    bluetooth.onStateChanged().listen((state) {
      switch (state) {
        case BlueThermalPrinter.CONNECTED:
          setState(() {
            _connected = true;
          });
          break;
        case BlueThermalPrinter.DISCONNECTED:
          setState(() {
            _connected = false;
          });
          break;
        default:
          print(state);
          break;
      }
    });

    if (!mounted) return;
    setState(() {
      _devices = devices;
    });

    if (isConnected) {
      setState(() {
        _connected = true;
      });
    }
  }

  GlobalKey<OverRepaintBoundaryState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Blue Thermal Printer'),
        ),
        body: Stack(
          children: [
            /*Capturer(
              overRepaintKey: globalKey,
            ),
               displayedImage != null
                ?  Image.file(File(displayedImage))
                : Container(
                    width: 0.0,
                    height: 0.0,
                  ),*/
            Container(
              color: Colors.transparent,
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Device:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: DropdownButton(
                            items: _getDeviceItems(),
                            onChanged: (value) =>
                                setState(() => _device = value),
                            value: _device,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.brown,
                          onPressed: () {
                            initPlatformState();
                          },
                          child: Text(
                            'Refresh',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        RaisedButton(
                          color: _connected ? Colors.red : Colors.green,
                          onPressed: _connected ? _disconnect : _connect,
                          child: Text(
                            _connected ? 'Disconnect' : 'Connect',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    /*     Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 50),
                      child: RaisedButton(
                        color: Colors.brown,
                        onPressed: () {
                          testPrint.sampleArabicAloneCp1256(pathImage);
                        },
                        child: Text('Arabic Alone Cp1256',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 50),
                      child: RaisedButton(
                        color: Colors.brown,
                        onPressed: () {
                          testPrint.sampleArabicAlonecp720(pathImage);
                        },
                        child: Text('Arabic Alone cp720',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 50),
                      child: RaisedButton(
                        color: Colors.brown,
                        onPressed: () {
                          testPrint.sampleArabicAlonecp864(pathImage);
                        },
                        child: Text('Arabic Alone cp864',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 50),
                      child: RaisedButton(
                        color: Colors.brown,
                        onPressed: () {
                          testPrint.sampleArabicAloneISO88596(pathImage);
                        },
                        child: Text('Arabic Alone ISO88596',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                   Padding(
                      padding:
                          const EdgeInsets.only(left: 10.0, right: 10.0, top: 50),
                      child: RaisedButton(
                        color: Colors.brown,
                        onPressed: () {
                          testPrint.sampleArabic(pathImage);
                        },
                        child: Text('PRINT Arabic TEST',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10.0, right: 10.0, top: 50),
                      child: RaisedButton(
                        color: Colors.brown,
                        onPressed: () {
                          testPrint.sampleLOGO(pathImageLOGO);
                        },
                        child: Text('PRINT LOGO TEST',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10.0, right: 10.0, top: 50),
                      child: RaisedButton(
                        color: Colors.brown,
                        onPressed: () {
                          testPrint.sampleArabicLOGg(pathImage);
                        },
                        child: Text('PRINT ARLOGO TEST',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),*/
    /*              Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 50),
                      child: RaisedButton(
                        color: Colors.brown,
                        onPressed: () async {
                          var renderObject =
                              globalKey.currentContext.findRenderObject();

                          RenderRepaintBoundary boundary = renderObject;
                          ui.Image captureImage =
                              await boundary.toImage(pixelRatio: 1.5);
                          final arabic2 = 'sale.png';
                          var arabic4bytes = await captureImage.toByteData(
                              format: ui.ImageByteFormat.png);
                          testPrint.sampleSaleBytesLOG(
                              arabic4bytes.buffer.asUint8List() ,_device);
                          /*  String arabic2bytesdirLOGO =
                              (await getApplicationDocumentsDirectory()).path;
                          writeToFile(
                              arabic4bytes, '$arabic2bytesdirLOGO/$arabic2');*/

                          // print("print : "+displayedImage);

                          /*  img.Image image = img.decodeImage(
                              await new Io.File('$arabic2bytesdirLOGO/$arabic2')
                                  .readAsBytes());
                          print("Before ==> Width : " +
                              image.width.toString() +
                              " Height : " +
                              image.width.toString());

                          // Resize the image to a 120x? thumbnail (maintaining the aspect ratio).
                          img.Image thumbnail = img.copyResize(image,
                              width: 300,
                              interpolation: img.Interpolation.average);
                          print("After ==> Width : " +
                              thumbnail.width.toString() +
                              " Height : " +
                              thumbnail.width.toString());

                          // Save the thumbnail as a PNG.
                          new Io.File('$arabic2bytesdirLOGO/$arabic2')
                            ..writeAsBytesSync(img.encodePng(thumbnail));
                          print("Width : " + thumbnail.width.toString());
                          int x = 0;*/
                          setState(() {
                            // displayedImage = '$arabic2bytesdirLOGO/$arabic2';
                          });

                        },
                        child: Text('PRINT Sale Sample Image TEST',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 50),
                      child: RaisedButton(
                        color: Colors.brown,
                        onPressed: () async {
                          var renderObject =
                              globalKey.currentContext.findRenderObject();

                          RenderRepaintBoundary boundary = renderObject;
                          ui.Image captureImage =
                              await boundary.toImage(pixelRatio: 1.5);
                          checkPermission(TargetPlatform.android)
                              .then((value) async {
                            if (value) {
                              var _localPath = ("/sdcard/downloads") +
                                  Platform.pathSeparator +
                                  'FekraPOS';
                              final savedDir = Directory(_localPath);

                              bool hasExisted = await savedDir.exists();
                              if (!hasExisted) {
                                await savedDir.create(recursive: true);
                              }

                              final arabic2 = 'sale.png';
                              var arabic2bytes = await captureImage.toByteData(
                                  format: ui.ImageByteFormat.png);

                              Uint8List pngBytes =
                                  arabic2bytes.buffer.asUint8List();
                              final img.Image image = img.decodeImage(pngBytes);
                              print(pngBytes);
                              File imgFile =
                                  new File('$_localPath/screenshot.png');
                              await imgFile.writeAsBytes(
                                  image.getBytes(format: img.Format.rgba));
                              await writeToFile(
                                  arabic2bytes, '$_localPath/$arabic2');
                              /*var bytes = await rootBundle
                                .load('$arabic2bytesdirLOGO/$arabic2');
                            String dir =
                            (await getApplicationDocumentsDirectory()).path;
                            await writeToFile(bytes, '$_localPath/$arabic2');*/
                              setState(() {
                                displayedImage = '$_localPath/$arabic2';
                              });
                              testPrint.sampleImageBytesLOGg(arabic2bytes);
                            }
                          });

                          // print("print : "+displayedImage);

                          /* img.Image image = img.decodeImage(
                              await new Io.File('$arabic2bytesdirLOGO/$arabic2')
                                  .readAsBytes());
                          print("Before ==> Width : " +
                              image.width.toString() +
                              " Height : " +
                              image.width.toString());

                          // Resize the image to a 120x? thumbnail (maintaining the aspect ratio).
                          img.Image thumbnail = img.copyResize(image,
                              width: 300,
                              interpolation: img.Interpolation.average);
                          print("After ==> Width : " +
                              thumbnail.width.toString() +
                              " Height : " +
                              thumbnail.width.toString());

                          // Save the thumbnail as a PNG.
                           var file  = new Io.File('$arabic2bytesdirLOGO/$arabic2') ;
                           await file.writeAsBytes(img.encodePng(thumbnail));
                          print("Width : " + thumbnail.width.toString());
                          int x = 0;
                          setState(() {
                            displayedImage = '$arabic2bytesdirLOGO/$arabic2';
                          });
                          await new Io.File('$arabic2bytesdirLOGO/$arabic2')
                              .readAsBytes();
                          testPrint.sampleImageBytesLOGg('$arabic2bytesdirLOGO/$arabic2');*/
                        },
                        child: Text('PRINT Cropped Sale Sample Image TEST',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 50),
                      child: RaisedButton(
                        color: Colors.brown,
                        onPressed: () async {
                          final filename = 'arabic2.png';
                          bytes = await rootBundle.load("assets/arabic2.png");
                          String dir =
                              (await getApplicationDocumentsDirectory()).path;

                          await writeToFile(bytes, '$dir/$filename');
                          testPrint.sampleImageBytesLOGg('$dir/$filename');
                        },
                        child: Text('PRINT Image 300*1K Bytes TEST',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 50),
                      child: RaisedButton(
                        color: Colors.brown,
                        onPressed: () {
                          testPrint.sampleArabicAloneISO88596("350*600");
                        },
                        child: Text('PRINT Image Bytes 300 TEST',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                       Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 50),
                      child: RaisedButton(
                        color: Colors.brown,
                        onPressed: () {
                          testPrint.sampleImageBytesLOGg(
                              arabic3bytes, "300*500");
                        },
                        child: Text('PRINT Image Bytes 300*500 TEST',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),*/
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 50),
                      child: RaisedButton(
                        color: Colors.brown,
                        onPressed: () {
                          testPrint.sampleArabicNormal("Normal");
                        },
                        child: Text('print Arabic Normal',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 50),
                      child: RaisedButton(
                        color: Colors.brown,
                        onPressed: () {
                          testPrint.sampleArabicAloneCp1256("Cp1256");
                        },
                        child: Text('Print Arabic Cp1256',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 50),
                      child: RaisedButton(
                        color: Colors.brown,
                        onPressed: () {
                          testPrint.sampleArabicAloneISO88596("ISO88596");
                        },
                        child: Text('Arabic Alone ISO88596',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 50),
                      child: RaisedButton(
                        color: Colors.brown,
                        onPressed: () {
                          testPrint.sampleArabicAlonecp864("Cp864");
                        },
                        child: Text('print Arabic Cp864',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 50),
                      child: RaisedButton(
                        color: Colors.brown,
                        onPressed: () {
                          testPrint.sampleArabicAlonecp720("Cp720");
                        },
                        child: Text('Arabic Alone Cp720',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> checkPermission(TargetPlatform platform) async {
    if (platform == TargetPlatform.android) {
      PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
      if (permission != PermissionStatus.granted) {
        Map<PermissionGroup, PermissionStatus> permissions =
            await PermissionHandler()
                .requestPermissions([PermissionGroup.storage]);
        if (permissions[PermissionGroup.storage] == PermissionStatus.granted) {
          return true;
        } else {
          return checkPermission(platform);
        }
      } else {
        return true;
      }
    }
    /*else {
      return true;
    }*/
    return false;
  }

  List<DropdownMenuItem<BluetoothDevice>> _getDeviceItems() {
    List<DropdownMenuItem<BluetoothDevice>> items = [];
    if (_devices.isEmpty) {
      items.add(DropdownMenuItem(
        child: Text('NONE'),
      ));
    } else {
      _devices.forEach((device) {
        items.add(DropdownMenuItem(
          child: Text(device.name),
          value: device,
        ));
      });
    }
    return items;
  }

  void _connect() {
    if (_device == null) {
      show('No device selected.');
    } else {
      bluetooth.isConnected.then((isConnected) {
        if (!isConnected) {
          bluetooth.connect(_device).catchError((error) {
            setState(() => _connected = false);
          });
          setState(() => _connected = true);
        }
      });
    }
  }

  void _disconnect() {
    bluetooth.disconnect();
    setState(() => _connected = true);
  }

//write to app path
  Future<void> writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return new File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  Future show(
    String message, {
    Duration duration: const Duration(seconds: 3),
  }) async {
    await new Future.delayed(new Duration(milliseconds: 100));
    Scaffold.of(context).showSnackBar(
      new SnackBar(
        content: new Text(
          message,
          style: new TextStyle(
            color: Colors.white,
          ),
        ),
        duration: duration,
      ),
    );
  }
}
