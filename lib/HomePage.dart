import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

import 'page/Home.dart' as datahome;
import 'page/Employee.dart' as employy;
import 'page/Popular.dart' as popular;


class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home>with SingleTickerProviderStateMixin {

  TabController controller;

  @override
  void initState() {

    controller=new TabController(length: 3, vsync: this);

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
        title: new Text("E-Commerce App"),
        backgroundColor: Colors.green,
        bottom: new TabBar(
           controller: controller,
          indicatorColor: Colors.white,
          indicatorWeight: 3.0,
          indicatorPadding: EdgeInsets.all(5.0),
          tabs: <Widget>[

            new Tab(icon: new Icon(Icons.home),text: "Home",),
            new Tab(icon: new Icon(Icons.list),text: "Employee",),
            new Tab(icon: new Icon(Icons.print),text: "Popular",)

          ],
        ),
      ),
      drawer: new Drawer(

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


