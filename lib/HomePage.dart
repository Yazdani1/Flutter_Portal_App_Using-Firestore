import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

  StreamSubscription<QuerySnapshot>subscription;

  List<DocumentSnapshot>snapshot;

  CollectionReference collectionReference=Firestore.instance.collection("AllDoda");

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

      appBar: new AppBar(
        title: new Text("E-Commerce App"),
        backgroundColor: Colors.green,
      ),
      
      body: new ListView.builder(
          itemCount: snapshot.length,
        itemBuilder: (context,index){
            return Card(
              elevation: 10.0,
              margin: EdgeInsets.all(10.0),
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
              ),
              child: new Container(
                height: 100.0,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Text(snapshot[index].data["title"],
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.deepPurple
                      ),
                      ),
                    ),

                    new SizedBox(height: 5.0,),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Text(
                        snapshot[index].data["des"],
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.green
                        ),
                      ),
                    )

                  ],
                ),
              ),
              
            );

        }
      ),
      
      

    );
  }
}


