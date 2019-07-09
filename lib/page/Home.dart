import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';


class DataHome extends StatefulWidget {
  @override
  _DataHomeState createState() => new _DataHomeState();
}

class _DataHomeState extends State<DataHome> {

  int sum=0;

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

  List<MaterialColor>_color=[Colors.orange,Colors.blue,Colors.purple,Colors
      .pink,Colors.amber];

  MaterialColor color;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.3),


      body: new ListView.builder(
          itemCount: snapshot.length,
        itemBuilder: (context,index){
          color=_color[index % _color.length];
            return Card(
              elevation: 10.0,
              margin: EdgeInsets.all(10.0),
              shape: BeveledRectangleBorder(
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
                              backgroundColor: color,
                              foregroundColor: Colors.white,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          
                          new Expanded(
                              flex: 1,
                            child: new ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child:new Image.network(snapshot[index].data["url"],
                              height: 160.0,
                              fit: BoxFit.cover,
                            ),
                            ),
                          ),
                          new SizedBox(width: 10.0,),

                          new Expanded(
                              flex: 2,
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Container(
                                  child: new Text(
                                    snapshot[index].data["des"],
                                    maxLines: 5,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black
                                    ),
                                  ),
                                ),
                                new SizedBox(height: 5.0,),

                                new Container(
                                  padding: EdgeInsets.all(7.0),
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: color
                                  ),
                                  child: InkWell(
                                    child: new Text("Read More",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.white
                                    ),
                                    ),
                                    onTap: (){
                                      
                                    },
                                  ),
                                )

                              ],
                            )
                          )

                        ],
                      ),
                    ),//end second container..

                    //start third container
                    new Container(
                      margin: EdgeInsets.all(10.0),
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          
                          new Expanded(
                              flex: 2,
                            child: new Container(
                             child: new Icon(Icons.thumb_up),
                            ),
                          ),
                          
                          new Expanded(
                              flex: 2,
                            child: new Icon(Icons.comment,color: Colors.green,),
                          ),
                          
                          
                          new Expanded(
                              flex: 2,
                            child: new Container(
                            child: new Icon(Icons.share,color: Colors.brown,),
                            ),
                          )
                          
                        ],
                      ),
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
