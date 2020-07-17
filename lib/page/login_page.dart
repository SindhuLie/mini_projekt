import 'package:flutter/material.dart';
import 'menu_page.dart';
import 'package:mini_projekt/reusable_widget.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyMain(),
    );
  }
}

class BodyMain extends StatefulWidget {
  @override
  _BodyMainState createState() => _BodyMainState();
}

class _BodyMainState extends State<BodyMain> {
  TextEditingController emailTextController;
  TextEditingController passwordTextController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ReusableTextField(
            textController: emailTextController,
            label: "Input your Email",
            isObscure: false,
          ),
          ReusableTextField(
            textController: passwordTextController,
            label: "Input your Password",
            isObscure: true,
          ),
          SizedBox(height: 16,),
          ReusableGreenBorderButton(
            text: "LOG IN",
            onPressed: (){
              setState(() {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MenuPage()));
              });
            },
          )
        ],
      ),
    );
  }
}



