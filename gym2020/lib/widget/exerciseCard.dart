import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ExerciseCard extends StatefulWidget {
  final String nomeRef;
  final String nomeRoot;
  ExerciseCard({Key key, this.nomeRef, this.nomeRoot}) : super(key: key);

  @override
  _ExerciseCardState createState() => _ExerciseCardState();
}

int i = 0;

class _ExerciseCardState extends State<ExerciseCard> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<String> stringList = snapshot.data.getStringList(widget.nomeRef);
          return Container(
            width: MediaQuery.of(context).size.width * 0.60,
            child: Column(
              children: [
                Text(
                  stringList[0].toUpperCase(),
                  style: TextStyle(color: Colors.redAccent[700]),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //ripetizioni
                    Text(
                      "Ripetizioni:",
                      style: TextStyle(color: Colors.redAccent[700]),
                    ),

                    Text(
                      stringList[2],
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.125,
                    ),
                    //recupero
                    Text(
                      "Recupero:",
                      style: TextStyle(color: Colors.redAccent[700]),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.125,
                    ),
                    Text(
                      stringList[4],
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //serie
                    Text(
                      "Serire:",
                      style: TextStyle(color: Colors.redAccent[700]),
                    ),
                    Text(
                      stringList[1],
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.20,
                    ),
                    //peso
                    Text(
                      "Peso:",
                      style: TextStyle(color: Colors.redAccent[700]),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.20,
                    ),
                    Text(
                      stringList[3],
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
                Spacer(),
                //bottoni
                Row(
                  children: [
                    FlatButton(
                      child: new Container(
                        padding: new EdgeInsets.all(10.0),
                        decoration: new BoxDecoration(
                          color: Colors.redAccent[700],
                        ),
                        child: new Text(
                          'azzera serie',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            fontFamily: 'helvetica_neue_light',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          i = 0;
                        });
                      },
                    ),
                    //conta serie
                    FlatButton(
                      child: new Container(
                        padding: new EdgeInsets.all(10.0),
                        decoration: new BoxDecoration(
                          color: Colors.redAccent[700],
                        ),
                        child: new Text(
                          'Conta Serie $i',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            fontFamily: 'helvetica_neue_light',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          i++;
                        });
                      },
                    ),
                    //rimuovi esercizio
                    FlatButton(
                      child: new Container(
                        padding: new EdgeInsets.all(10.0),
                        decoration: new BoxDecoration(
                          color: Colors.redAccent[700],
                        ),
                        child: new Text(
                          'Rimuovi Esercizio',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            fontFamily: 'helvetica_neue_light',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onPressed: () {
                        return showDialog(
                            context: context,
                            child: AlertDialog(
                              title: Text("Conferma rimozione esercizio"),
                              content: Container(
                                child: Row(
                                  children: [
                                    FlatButton(
                                        child: Container(
                                          child: Text("annulla"),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        }),
                                    FlatButton(
                                        child: Container(
                                          child: Text("conferma"),
                                        ),
                                        onPressed: () {
                                          snapshot.data.remove(widget.nomeRef);
                                          List<String> exerciseList = snapshot
                                              .data
                                              .getStringList(widget.nomeRoot);
                                          exerciseList.remove(widget.nomeRef);
                                          snapshot.data.setStringList(
                                              widget.nomeRoot, exerciseList);
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        }),
                                  ],
                                ),
                              ),
                            ));
                      },
                    ),
                  ],
                )
              ],
            ),
          );
        }
        return Container(
          child: Text(
            "caricamento...",
            style: TextStyle(color: Colors.redAccent[700]),
          ),
        );
      },
    );
  }
}
