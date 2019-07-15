import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class HomeDetails extends StatefulWidget {

  DocumentSnapshot snapshot;

  HomeDetails(this.snapshot);

  @override
  _HomeDetailsState createState() => new _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      
      appBar: new AppBar(
        backgroundColor: Colors.green,
        title: new Text("Home Details Data"),
      ),

      body: new ListView(
        children: <Widget>[
          
          new Container(
            margin: EdgeInsets.all(10.0),
            child: new Card(
              elevation: 10.0,
              child: new ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: new Image.network(widget.snapshot.data["url"],
                fit: BoxFit.cover,
                ),
              ),
            ),
          )

        ],
      ),

    );
  }
}

