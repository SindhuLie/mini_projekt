import 'package:flutter/material.dart';
import 'package:mini_projekt/constant/constant.dart';
import 'package:mini_projekt/reusable_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrBuilderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "QR Builder",
          style: kGreenAppBarTextStyle,
        ),
      ),
      body: QrBody(),
    );
  }
}

class QrBody extends StatefulWidget {
  @override
  _QrBodyState createState() => _QrBodyState();
}

class _QrBodyState extends State<QrBody> {
  TextEditingController textController = new TextEditingController();

  Widget showQR(String text){
    if (text != ''){
      return QrImage(
        data: text,
        version: QrVersions.auto,
        size: 300,
        backgroundColor: Colors.white,
      );
    } else{
      return SizedBox(height: 0,);
    }

  }

  String listener(){
    String text;
    setState(() {
      text = textController.text;
    });
    return text;
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textController.addListener(listener);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 0,horizontal: 16),
          child: ReusableTextField(
            textController: textController,
            label: "Input any Text",
            isObscure: false,
          ),
        ),
        SizedBox(height: 16,),
        Container(
          child: showQR(listener())
        ),
      ],
    );
  }
}
