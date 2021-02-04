import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Page2Card extends StatefulWidget {
  final String nome;
  Page2Card({Key key, this.nome}) : super(key: key);

  @override
  _Page2CardState createState() => _Page2CardState();
}

class _Page2CardState extends State<Page2Card> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
      child: Stack(
        children: [
          Container(
            width: 300,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(5, 5),
                      blurRadius: 1.0,
                      spreadRadius: 1.0)
                ],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('lib/assets/${widget.nome}.jpg'),
                ),
                borderRadius: new BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                )),
          ),
          Container(
            width: 300,
            decoration: BoxDecoration(
                color: Color.fromRGBO(10, 10, 10, 100),
                borderRadius: new BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                )),
            child: Center(
              child: Container(
                child: Column(
                  children: [
                    Text(
                      widget.nome,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        color: Colors.redAccent[700],
                        fontSize: 18.0,
                        fontFamily: 'helvetica_neue_light',
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.20,
                    ),
                    FutureBuilder(
                      future: SharedPreferences.getInstance(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        String _hint = 'Massimale...';
                        if (snapshot.hasData) {
                          _hint = snapshot.data.getString(widget.nome) ??
                              'Massimale...';

                          return GestureDetector(
                            onTap: () {
                              return showDialog(
                                  context: context,
                                  child: AlertDialog(
                                    title: Text("Cambia Peso"),
                                    content: Container(
                                      child: TextField(
                                        keyboardType: TextInputType.text,
                                        onChanged: (value) => snapshot.data
                                            .setString(widget.nome, value),
                                        decoration: new InputDecoration(
                                          contentPadding: new EdgeInsets.only(
                                              left: 10.0,
                                              top: 10.0,
                                              bottom: 10.0,
                                              right: 10.0),
                                          hintText: 'Peso...',
                                          hintStyle: new TextStyle(
                                            color: Colors.redAccent,
                                            fontSize: 10.0,
                                            fontFamily: 'helvetica_neue_light',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ));
                            },
                            child: Center(
                              child: Container(
                                child: Text(
                                  _hint ?? 'Massimale...',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.redAccent[700],
                                    fontSize: 50,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                        return Text('caricamento...');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
