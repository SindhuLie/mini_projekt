import 'package:flutter/material.dart';
import 'package:mini_projekt/constant/constant.dart';
import 'package:mini_projekt/models.dart';
import 'package:mini_projekt/reusable_widget.dart';
import 'camera_page.dart';
import 'qr_builder_page.dart';
import 'qr_scan_page.dart';

class ListPage extends StatefulWidget {
  ListPage({this.user,this.personList});
  Person user;
  List<Person> personList;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Back, ${widget.user.firstName}",style: kGreenAppBarTextStyle),
      ),
      body: BodyPage(personList: widget.personList,),
    );
  }
}

class BodyPage extends StatefulWidget {
  BodyPage({this.personList});
  List<Person> personList;

  @override
  _BodyPageState createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20,),
        Center(child: Text(
          "Cool Hacker ListView", style: kGreenTitleTextStyle,
          ),
        ),
        Expanded(
          child: TableList(personList: widget.personList,),
        ),
        SizedBox( height: 16,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ReusableGreenBorderButton(
              text: "QR BUILDER",
              onPressed: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>QrBuilderPage()));
                });
              },
            ),
            ReusableGreenBorderButton(
              text: "QR SCANNER",
              onPressed: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>QrScanPage()));
                });
              },
            ),
          ],
        ),
        SizedBox( height: 16,),
        ReusableGreenBorderButton(
          text: "CAMERA",
          onPressed: (){
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CameraPage()));
            });
          },
        ),
        SizedBox( height: 50,),
      ],
    );
  }
}

class TableList extends StatefulWidget {
  TableList({this.personList});
  final List<Person> personList;
  @override
  _TableListState createState() => _TableListState();
}

class _TableListState extends State<TableList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context,index){
        return Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.symmetric(vertical: 4,horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.black54,
            ),
            child: Column(
              children: <Widget>[
                Text("Name: ${widget.personList[index].firstName} ${widget.personList[index].lastName}",style: kGreenListTextStyle,),
                Text("Email: ${widget.personList[index].email}",style: kGreenListTextStyle,),
                Text("UserID: ${widget.personList[index].id}",style: kGreenListTextStyle,),
              ],
            )
        );
      },
      itemCount: widget.personList.length,
    );
  }
}


