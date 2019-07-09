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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
              ),
              child: new Container(
                height: 300.0,
                child: new Column(
                  children: <Widget>[

                    new Container(
                      margin: EdgeInsets.all(10.0),
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          new Expanded(
                            flex: 1,
                            child: new CircleAvatar(
                              backgroundColor: Colors.green,
                              child: new Text(snapshot[index].data["title"][0]),
                            ),
                          ),
                          new SizedBox(width: 10.0,),
                          
                          new Expanded(
                              flex: 4,
                            child: new Text(snapshot[index].data["title"],
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black
                            ),
                            ),
                          )

                        ],
                      ),

                    ),//end first Container

                    //start second container
                    new Container(
                      margin: EdgeInsets.all(10.0),
                      child: new Row(
                        children: <Widget>[
                          
                          new Expanded(
                              flex: 1,
                            child: new ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child:new Image.network(snapshot[index].data["url"],
                              height: 130.0,
                              fit: BoxFit.cover,
                            ),
                            ),
                          ),
                          new SizedBox(width: 5.0,),

                          
                          
                        ],
                      ),
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
