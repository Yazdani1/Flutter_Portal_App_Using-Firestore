import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class PopularDetails extends StatefulWidget {

  DocumentSnapshot snapshot;

  PopularDetails(this.snapshot);

  @override
  _PopularDetailsState createState() => new _PopularDetailsState();
}

class _PopularDetailsState extends State<PopularDetails> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        title: new Text("Popular Details"),
        backgroundColor: Colors.green,
      ),
      body: new ListView(
        children: <Widget>[



        ],
      ),
    );
  }
}

