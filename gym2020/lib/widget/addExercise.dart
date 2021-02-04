import 'package:flutter/material.dart';
import 'package:gym2020/data/choices.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddExercise extends StatefulWidget {
  final Content cont;
  AddExercise({Key key, this.cont}) : super(key: key);

  @override
  _AddExerciseState createState() => _AddExerciseState();
}

class _AddExerciseState extends State<AddExercise> {
  TextEditingController _controller1;
  TextEditingController _controller2;
  TextEditingController _controller3;
  TextEditingController _controller4;
  TextEditingController _controller5;
  String nomeEs, rep, sets, peso, recupero;
  SharedPreferences _prefs;
  initShared() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    _controller1 = TextEditingController();
    _controller2 = TextEditingController();
    _controller3 = TextEditingController();
    _controller4 = TextEditingController();
    _controller4 = TextEditingController();
    initShared();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        children: <Widget>[
          // blocco nome
          new Container(
            child: new Text(
              'Inserisci nome esercizio:',
              style: TextStyle(
                color: Colors.redAccent[700],
                fontSize: 12.0,
                fontFamily: 'helvetica_neue_light',
              ),
              textAlign: TextAlign.center,
            ),
          ),

          new Container(
              child: new TextField(
            keyboardType: TextInputType.text,
            controller: _controller1,
            style: TextStyle(
              color: Colors.redAccent[700],
            ),
            onChanged: (value) => nomeEs = value,
            decoration: new InputDecoration(
              filled: true,
              contentPadding: new EdgeInsets.only(
                  left: 10.0, top: 0.0, bottom: 10.0, right: 10.0),
              hintText: 'nome esercizio...',
              hintStyle: new TextStyle(
                color: Colors.red.shade500,
                fontSize: 10.0,
                fontFamily: 'helvetica_neue_light',
              ),
            ),
          )),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //blocco rep
                Container(
                  decoration: new BoxDecoration(),
                  child: new Text(
                    'numero ripetizioni:',
                    style: TextStyle(
                      color: Colors.redAccent[700],
                      fontSize: 12.0,
                      fontFamily: 'helvetica_neue_light',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.175,
                ),
                //blocco serie
                Container(
                  decoration: new BoxDecoration(),
                  child: new Text(
                    'numero serie:',
                    style: TextStyle(
                      color: Colors.redAccent[700],
                      fontSize: 12.0,
                      fontFamily: 'helvetica_neue_light',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //blocco rep
              new Container(
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: new TextField(
                    keyboardType: TextInputType.text,
                    controller: _controller2,
                    style: TextStyle(
                      color: Colors.redAccent[700],
                    ),
                    onChanged: (value) => rep = value,
                    decoration: new InputDecoration(
                      contentPadding: new EdgeInsets.only(
                          left: 10.0, top: 0.0, bottom: 10.0, right: 10.0),
                      hintText: 'N° rep...',
                      hintStyle: new TextStyle(
                        color: Colors.redAccent,
                        fontSize: 10.0,
                        fontFamily: 'helvetica_neue_light',
                      ),
                    ),
                  )),
              //blocco serie
              new Container(
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: new TextField(
                    keyboardType: TextInputType.text,
                    controller: _controller3,
                    style: TextStyle(
                      color: Colors.redAccent[700],
                    ),
                    onChanged: (value) => sets = value,
                    decoration: new InputDecoration(
                      contentPadding: new EdgeInsets.only(
                          left: 10.0, top: 10.0, bottom: 10.0, right: 10.0),
                      hintText: 'N° Set...',
                      hintStyle: new TextStyle(
                        color: Colors.redAccent,
                        fontSize: 10.0,
                        fontFamily: 'helvetica_neue_light',
                      ),
                    ),
                  )),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //blocco peso
                Container(
                  decoration: new BoxDecoration(),
                  child: new Text(
                    'Peso:',
                    style: TextStyle(
                      color: Colors.redAccent[700],
                      fontSize: 12.0,
                      fontFamily: 'helvetica_neue_light',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.375,
                ),
                //blocco recupero
                Container(
                  decoration: new BoxDecoration(),
                  child: new Text(
                    'Recupero:',
                    style: TextStyle(
                      color: Colors.redAccent[700],
                      fontSize: 12.0,
                      fontFamily: 'helvetica_neue_light',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //blocco peso
              new Container(
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: new TextField(
                    keyboardType: TextInputType.text,
                    controller: _controller4,
                    style: TextStyle(
                      color: Colors.redAccent[700],
                    ),
                    onChanged: (value) => peso = value,
                    decoration: new InputDecoration(
                      contentPadding: new EdgeInsets.only(
                          left: 10.0, top: 0.0, bottom: 10.0, right: 10.0),
                      hintText: 'kg...',
                      hintStyle: new TextStyle(
                        color: Colors.redAccent,
                        fontSize: 10.0,
                        fontFamily: 'helvetica_neue_light',
                      ),
                    ),
                  )),
              //blocco recupero
              new Container(
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: new TextField(
                    keyboardType: TextInputType.text,
                    controller: _controller5,
                    style: TextStyle(
                      color: Colors.redAccent[700],
                    ),
                    onChanged: (value) => recupero = value,
                    decoration: new InputDecoration(
                      contentPadding: new EdgeInsets.only(
                          left: 10.0, top: 10.0, bottom: 10.0, right: 10.0),
                      hintText: 'tempo...',
                      hintStyle: new TextStyle(
                        color: Colors.redAccent,
                        fontSize: 10.0,
                        fontFamily: 'helvetica_neue_light',
                      ),
                    ),
                  )),
            ],
          ),
          //BOTTONE CONFERMA
          FlatButton(
            onPressed: () {
              List<String> stringlist = [];
              if (nomeEs == null ||
                  rep == null ||
                  sets == null ||
                  peso == null ||
                  recupero == null) {
                return showDialog(
                    context: context,
                    child: AlertDialog(
                      title: Text("completa tutti i campi"),
                    ));
              }
              stringlist.add(nomeEs);
              stringlist.add(rep);
              stringlist.add(sets);
              stringlist.add(peso);
              stringlist.add(recupero);
              _prefs.setStringList(nomeEs, stringlist);
              if (_prefs.getStringList(widget.cont.title) != null) {
                Set<String> stringlist2 =
                    _prefs.getStringList(widget.cont.title).toSet();
                stringlist2.add(nomeEs);
                _prefs.setStringList(widget.cont.title, stringlist2.toList());
              } else {
                Set<String> stringlist2 = {};
                stringlist2.add(nomeEs);
                _prefs.setStringList(widget.cont.title, stringlist2.toList());
              }
              Navigator.of(context).pop();
            },
            child: new Container(
              padding: new EdgeInsets.all(12.0),
              decoration: new BoxDecoration(
                color: Colors.redAccent[700],
              ),
              child: new Text(
                'Conferma',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontFamily: 'helvetica_neue_light',
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
