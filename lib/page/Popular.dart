import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutter_firebase_ecommerce/DetalPage/PopularDetails.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => new _PopularState();
}

class _PopularState extends State<Popular> {

  StreamSubscription<QuerySnapshot>subscription;
  List<DocumentSnapshot>snapshot;

  CollectionReference collectionReference=Firestore.instance.collection("Popular");
  


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

      body: new ListView.builder(
         itemCount: snapshot.length,
        itemBuilder: (context,index){

          color=_color[index % _color.length];

           return Card(
             margin: EdgeInsets.all(8.0),
             elevation: 10.0,
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(15.0)
             ),
             child: new Container(
               height: 300.0,
               child: new Column(
                 children: <Widget>[

                   new Container(
                     margin: EdgeInsets.all(5.0),
                     child: new Image.network(snapshot[index].data["pic"],
                     height: 150.0,
                       width: MediaQuery.of(context).size.width,
                       fit: BoxFit.cover,
                     ),
                   ),
                   new SizedBox(height: 5.0,),

                   
                   new Container(
                     margin: EdgeInsets.all(5.0),
                     child: new Column(
                       children: <Widget>[

                         new Container(
                           child: new Row(
                             children: <Widget>[
                               new CircleAvatar(
                                 backgroundColor: color,
                                 child: new Text(snapshot[index].data["title"][0]),
                                 foregroundColor: Colors.white,
                               ),
                               new SizedBox(width: 5.0,),

                               InkWell(
                                 child: new Text(snapshot[index].data["title"],
                                 maxLines: 1,
                                 style: TextStyle(
                                   fontSize: 22.0,
                                   color: Colors.green
                                 ),
                                 ),
                                 onTap: (){
                                   Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>PopularDetails(snapshot[index])));
                                 },
                               )

                             ],
                           ),
                         ),
                         new SizedBox(height: 5.0,),

                         new Container(
                           margin: EdgeInsets.all(5.0),
                           child: new Text(snapshot[index].data["des"],
                           maxLines: 3,
                           style: TextStyle(
                             fontSize: 17.0,
                             color: Colors.black
                           ),
                           ),
                         )

                       ],
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
