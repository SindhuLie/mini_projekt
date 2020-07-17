import 'package:flutter/material.dart';
import 'package:mini_projekt/page/login_page.dart';

void main() {
  runApp(MiniProjekt());
}

class MiniProjekt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoginPage(),
    );
  }
}

