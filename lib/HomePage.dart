import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'page/Employee.dart';
import 'page/Home.dart' as datahome;
import 'page/Employee.dart' as employy;
import 'page/Popular.dart' as popular;
import 'package:flutter_firebase_ecommerce/page/Employee.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home>with SingleTickerProviderStateMixin {

  TabController controller;
  @override
  void initState() {

    controller=new TabController(length: 3, vsync: this);

    //Timer(Duration(seconds: 3),()=>Navigator.of(context).push(new MaterialPageRoute(builder: (con)=>Employee())));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Bright Portal App"),
        backgroundColor: Colors.green,
        bottom: new TabBar(
           controller: controller,
          indicatorColor: Colors.white,
          indicatorWeight: 3.0,
          indicatorPadding: EdgeInsets.all(5.0),
          tabs: <Widget>[

            new Tab(icon: new Icon(Icons.home),text: "Home",),
            new Tab(icon: new Icon(Icons.list),text: "Employee",),
            new Tab(icon: new Icon(Icons.poll),text: "Popular",)

          ],
        ),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[

            new UserAccountsDrawerHeader(
                accountName: new Text("Code With YDC"), 
                accountEmail: new Text("ydc@gmail.com"),
              decoration: new BoxDecoration(
                color: Colors.green
              ),
            ),
            new ListTile(
              title: new Text("Home"),
              leading: new Icon(Icons.home),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),

            new ListTile(
              title: new Text("Employee"),
              leading: new Icon(Icons.shuffle),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),

            new ListTile(
              title: new Text("Popular"),
              leading: new Icon(Icons.poll),
              onTap: (){
                Navigator.of(context).pop();
              },
            )

            
          ],
        ),
      ),
      body: new TabBarView(
          controller: controller,
        children: <Widget>[

          new datahome.DataHome(),
          new employy.Employee(),
          new popular.Popular()
        ],
      ),

    );
  }
}


