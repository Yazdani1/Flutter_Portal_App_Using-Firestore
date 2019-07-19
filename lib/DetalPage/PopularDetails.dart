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

          new Container(
            margin: EdgeInsets.all(10.0),
            child: new Card(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(15.0)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: new Image.network(widget.snapshot.data["pic"],
                height: 200.0,
                fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          new SizedBox(height: 6.0,),

          Card(
            elevation: 10.0,
            margin: EdgeInsets.all(6.0),
            child: new Container(
              margin: EdgeInsets.all(10.0),
              child: new Column(
                children: <Widget>[

                  new Container(
                    padding: EdgeInsets.all(6.0),
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          child: new CircleAvatar(
                            child: new Text(widget.snapshot.data["title"][0]),
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                        ),
                        new SizedBox(width: 5.0,),
                        new Container(
                          child: new Text(widget.snapshot.data["title"],
                          style: TextStyle(
                            fontSize: 21.0,
                            color: Colors.green
                          ),
                          ),
                        )


                      ],
                    ),
                  ),
                  new SizedBox(height: 5.0,),

                  new Text(widget.snapshot.data["des"],
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black
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

