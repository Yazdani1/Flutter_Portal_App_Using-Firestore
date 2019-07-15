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
          ),

          new SizedBox(height: 5.0,),

          new Container(
            margin: EdgeInsets.all(10.0),

            child: new Card(
              elevation: 10.0,
              
              child: new Column(
                children: <Widget>[

                  new Container(
                    padding: EdgeInsets.all(6.0),
                    child: new Row(
                      children: <Widget>[

                        new CircleAvatar(
                          backgroundColor: Colors.green,
                          child: new Text(widget.snapshot.data["title"][0]),
                          foregroundColor: Colors.white,
                        ),

                        new SizedBox(width: 5.0,),

                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: new Text(widget.snapshot.data["title"],
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.green
                          ),
                          ),
                        )

                      ],
                    ),
                  ),
                  new SizedBox(height: 5.0,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(widget.snapshot.data["des"],
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.black
                    ),
                    ),
                  )

                ],
              ),
            ),
          )


        ],
      ),

    );
  }
}

