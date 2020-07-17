import 'package:flutter/material.dart';
import 'package:mini_projekt/constant/constant.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "QR SCANNER",
          style: kGreenAppBarTextStyle,
        ),
      ),
      body: QrScanBody(),
    );
  }
}

class QrScanBody extends StatefulWidget {
  @override
  _QrScanBodyState createState() => _QrScanBodyState();
}

class _QrScanBodyState extends State<QrScanBody> {
  final GlobalKey qrKey = GlobalKey();
  String barcode = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: QRView(
            key: qrKey,
            onQRViewCreated: (controller) {
              controller.scannedDataStream.listen((value) {
                setState(() {
                  barcode = value;
                });
              });
            },
          ),
        ),
        Expanded(
          child: Center(
            child: Text('Result: $barcode',style: kGreenListTextStyle,),
          ),
        ),
      ],
    );
  }
}

