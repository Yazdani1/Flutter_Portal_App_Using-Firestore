import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class Employee extends StatefulWidget {
  @override
  _EmployeeState createState() => new _EmployeeState();
}

class _EmployeeState extends State<Employee> {

  StreamSubscription<QuerySnapshot>subscription;

  List<DocumentSnapshot>snapshot;
  
  CollectionReference collectionReference=Firestore.instance.collection("Employee");
  
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
      
      backgroundColor: Colors.grey.withOpacity(0.4),
      
      body: new ListView.builder(
          itemCount: snapshot.length,
        reverse: false,
        itemBuilder: (context,index){

            if(snapshot.length<0){
              return Center(
                child: new Text("Loading..."),
              );
            }else{
              return Card(
                elevation: 10.0,
                margin: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)
                ),
                child: new Container(
                  height: 140.0,
                  margin: EdgeInsets.all(6.0),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      new Expanded(
                        flex: 1,
                        child: new ClipRRect(
                          borderRadius: BorderRadius.circular(90.0),
                          child: new Image.network(snapshot[index].data["pic"],
                            height: 120.0,
                            width: 120.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      new SizedBox(width: 5.0,),
                      new Expanded(
                        flex: 2,
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            new Text(snapshot[index].data["name"],
                              style: TextStyle(
                                  fontSize: 21.0,
                                  color: Colors.black
                              ),
                            ),
                            new SizedBox(height: 5.0,),

                            new Text(snapshot[index].data["location"],
                              style: TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.green
                              ),
                            ),
                            new SizedBox(height: 5.0,),
                            new Text(snapshot[index].data["position"],
                              style: TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.green
                              ),
                            ),
                            new SizedBox(height: 5.0,),
                            new Text(snapshot[index].data["experience"],
                              style: TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.green
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

        }
      ),
      
    );
  }
}
