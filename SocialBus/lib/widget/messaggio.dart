import 'dart:math';

import 'package:flutter/material.dart';
import 'package:prova/service/graphicFn.dart';

class Messaggio extends StatelessWidget {
  final String fermata;
  final String ritardo;
  final String userName;
  final bool me;
  const Messaggio({Key key, this.userName, this.me, this.fermata, this.ritardo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var rng = new Random();
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 5, 5, 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment:
            me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: me ? hexToColor("#E2FFC9") : hexToColor("#FCFFFE"),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  Text(me ? "Tu" : "$userName",
                      textAlign: me ? TextAlign.right : TextAlign.left,
                      
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: me
                            ? Colors.black
                            : Color.fromARGB(255, rng.nextInt(255),
                                rng.nextInt(255), rng.nextInt(255)),
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Container(child: Text("Fermata: $fermata")),
                  Container(child: Text("Ritardo: $ritardo")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
