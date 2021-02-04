import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:prova/data_storage/apirutes.dart';
import 'package:prova/data_storage/userData.dart';
import 'package:prova/service/graphicFn.dart';
import 'package:prova/widget/messaggio.dart';

class Chat extends StatefulWidget {
  final APIRoute bus;
  final UserData user;
  Chat({Key key, this.bus, this.user}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  CollectionReference _colec;
  Map map;
  @override
  initState() {
    setUp();
    super.initState();
  }

  void setUp() async {
    _colec = Firestore.instance.collection(widget.bus.routeLongName);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _fermataController = TextEditingController();
    TextEditingController _ritardoController = TextEditingController();
    String fermata, ritardo;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: hexToColor("#0058A5"),
        title: Row(
          children: <Widget>[
            Icon(
              Icons.directions_bus,
            ),
            Text(
              'SocialBus',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          StreamBuilder<QuerySnapshot>(
              stream: _colec.orderBy('date').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.black, width: 2))),
                      child: ListView(
                        children: snapshot.data.documents.map((doc) {
                          return Messaggio(
                            userName: doc.data['user'],
                            fermata: doc.data['fermata'],
                            ritardo: doc.data['ritardo'],
                            me: doc.data['user'] == widget.user.userName
                                ? true
                                : false,
                          );
                        }).toList(),
                      ),
                    ),
                  );
                } else {
                  return SpinKitWanderingCubes(
                    color: Colors.green[700],
                    size: 50.0,
                  );
                }
              }),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            child: Container(
              child: Material(
                color: Colors.blue[800],
                elevation: 6.0,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  minWidth: 200.0,
                  height: 45.0,
                  child: Text("Aggiungi messaggio"),
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                          title: Text("Inserisci Messaggio"),
                          content: Card(
                              child: Column(
                            children: <Widget>[
                              Text("Fermata:"),
                              TextField(
                                  controller: _fermataController,
                                  keyboardType: TextInputType.text,
                                  onChanged: (value) => fermata = value,
                                  decoration: InputDecoration(
                                    hintText: "Inserisci Testo...",
                                    border: const OutlineInputBorder(),
                                  )),
                              Text("Ritardo:"),
                              TextField(
                                  controller: _ritardoController,
                                  keyboardType: TextInputType.text,
                                  onChanged: (value) => ritardo = value,
                                  decoration: InputDecoration(
                                    hintText: "Inserisci Testo...",
                                    border: const OutlineInputBorder(),
                                  )),
                            ],
                          )),
                          actions: <Widget>[
                            FlatButton(
                              child: Text("Invia"),
                              onPressed: () {
                                _colec.add({
                                  'ritardo': ritardo,
                                  "fermata": fermata,
                                  "user": widget.user.userName,
                                  "date": DateTime.now()
                                      .toIso8601String()
                                      .toString(),
                                });
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                              },
                            )
                          ]);
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
