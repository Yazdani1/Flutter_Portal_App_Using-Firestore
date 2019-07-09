import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class DataHome extends StatefulWidget {
  @override
  _DataHomeState createState() => new _DataHomeState();
}

class _DataHomeState extends State<DataHome> {

  StreamSubscription<QuerySnapshot>subscription;
  List<DocumentSnapshot>snapshot;

  CollectionReference collectionReference=Firestore.instance.collection("HomeData");

  @override
  void initState() {

    subscription=collectionReference.snapshots().listen((datasnap){
      setState(() {
        snapshot=datasnap.documents;
      });
    });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey,
      body: new ListView.builder(
          itemCount: snapshot.length,
        itemBuilder: (context,index){
            return Card(
              elevation: 10.0,
              margin: EdgeInsets.all(10.0),
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
              ),
              child: new Container(
                height: 200.0,
                child: new Column(
                  children: <Widget>[

                    new Container(

                    ),//end first Container

                    //start second container
                    new Container(

                    ),//end second container..

                    //start third container
                    new Container(

                    ),//end third container..

                  ],
                ),
              ),
            );
        }
      ),

    );
  }
}
