import 'package:flutter/material.dart';

class ReusableGreenBorderButton extends StatelessWidget {
  ReusableGreenBorderButton({this.text,this.onPressed});

  final String text;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 180,
      height: 60,
      child: FlatButton(
        child: Text(text,
          style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold
          ),
        ),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: BorderSide(color: Colors.green),
        ),
      ),
    );
  }
}

class ReusableTextField extends StatelessWidget {
  ReusableTextField({this.textController,this.label,this.isObscure});

  final TextEditingController textController;
  final String label;
  final bool isObscure;


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      style: TextStyle(
        color: Colors.green,
      ),
      obscureText: isObscure,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.green),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
    );
  }
}

