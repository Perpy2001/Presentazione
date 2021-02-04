import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gym2020/data/choices.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'exercises.dart';

class Contentcard extends StatefulWidget {

  Contentcard({Key key, this.cont}) : super(key: key);
  Content cont;

  @override
  ContentcardState createState() => ContentcardState();

  static ContentcardState of(BuildContext context) {
    assert(context != null);
    final ContentcardState result = context.findAncestorStateOfType<ContentcardState>();
    if (result != null) 
      return result;
   
  }


}

class ContentcardState extends State<Contentcard> {
 
    void updateState() {
    setState(() {
    });}
  @override
  Widget build(BuildContext context) {
    Content cont = widget.cont;
    return GestureDetector(
      onTap: () {
        return showModalBottomSheet(
            backgroundColor: Color.fromRGBO(0, 0, 0, 100),
            context: context,
            builder: (BuildContext bc) {
              return Exercises(
                cont: cont,
                refresh: updateState,
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.50,
              height: MediaQuery.of(context).size.height * 0.275,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(5, 2),
                      blurRadius: 1.0,
                      spreadRadius: 1.0)
                ],
                image: DecorationImage(image: cont.image, fit: BoxFit.cover),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.50,
              height: MediaQuery.of(context).size.height * 0.275,
              decoration: BoxDecoration(
                color: Color.fromRGBO(10, 10, 10, 100),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        cont.title.toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          color: Colors.redAccent[700],
                          fontSize: 15.0,
                          fontFamily: 'helvetica_neue_light',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: FutureBuilder(
                          future: SharedPreferences.getInstance(),
                          builder: (BuildContext context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                  cont.date ??
                                      snapshot.data
                                          .getString('${cont.title}date') ??
                                      '',
                                  style: TextStyle(
                                    color: Colors.white70,
                                  ));
                            } else
                              return Text('nessun giorno',
                                  style: TextStyle(
                                    color: Colors.redAccent[700],
                                  ));
                          }),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
 

}
