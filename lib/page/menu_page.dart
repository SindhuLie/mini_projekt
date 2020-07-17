import 'package:flutter/material.dart';
import 'package:mini_projekt/constant/constant.dart';
import 'list_page.dart';
import 'package:mini_projekt/reusable_widget.dart';
import 'package:mini_projekt/models.dart';
import 'package:mini_projekt/api_service.dart';



class MenuPage extends StatefulWidget {
  Person user;
  List<Person> personList;
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {


  Future getUser() async{
    Person data = await Services().getUser();
    print(data.toString());
    setState(() {
      widget.user = data;
    });
  }

  Future getPersonList() async{
    List<Person> data = await Services().getUserList();
    print(data.toString());
    setState(() {
      widget.personList = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
    getPersonList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.user != null ?
      AppBar(
        title: Text("Welcome Back, ${widget.user.firstName}",style: kGreenAppBarTextStyle),
      ):
      AppBar(
        title: Text("Welcome Back, ",style: kGreenAppBarTextStyle),
      ),
      body: Menu(user: widget.user,personList: widget.personList,),
    );
  }
}

class Menu extends StatefulWidget {
  Menu({this.user,this.personList});
  Person user;
  List<Person> personList;
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset('images/WorldMeme.jpg',width: double.infinity,),
        Center(child: Text("What Now?", style: kGreenTitleTextStyle)),
        SizedBox(height: 16),
        ReusableGreenBorderButton(
          text: "START HACKING",
          onPressed: (){
            setState(() {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ListPage(user: widget.user,personList: widget.personList,)));
            });
          },
        ),
      ],
    );
  }
}

