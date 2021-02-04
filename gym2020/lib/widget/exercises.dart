import 'package:flutter/material.dart';
import 'package:gym2020/data/choices.dart';
import 'package:gym2020/widget/exerciseCard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'addExercise.dart';
import 'homecard.dart';

class Exercises extends StatefulWidget {
  final Function() refresh;
  Content cont;
  Exercises({Key key, this.cont, @required this.refresh}) : super(key: key);

  @override
  _ExercisesState createState() => _ExercisesState();
}

class _ExercisesState extends State<Exercises> {
  SharedPreferences _prefs;
  initShared() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<String> getLanguageCode(ref) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(ref) ?? 'scegli giorno';
  }

  @override
  void initState() {
    initShared();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Content cont = widget.cont;
    return Container(
      color: Color.fromRGBO(0, 0, 0, 100),
      height: MediaQuery.of(context).size.height * 0.80,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  cont.title.toUpperCase(),
                  style: TextStyle(
                    color: Colors.redAccent[700],
                  ),
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.cancel,
                  size: 25,
                  color: Colors.redAccent[700],
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
          Row(
            children: [
              DropdownButton<String>(
                hint: FutureBuilder<String>(
                    future: getLanguageCode('${cont.title}date'),
                    initialData: 'scegli giorno',
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data,
                            style: TextStyle(
                              color: Colors.redAccent[700],
                            ));
                      } else
                        return Text('scegli giorno',
                            style: TextStyle(
                              color: Colors.redAccent[700],
                            ));
                    }),
                items: days.map((String dropDownItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownItem,
                    child: Text(dropDownItem),
                  );
                }).toList(),
                onChanged: (String newValue) {
                  widget.refresh();
                  setState(() {
                    cont.setDate(newValue);
                    _prefs.setString('${cont.title}date', newValue);
                  });
                },
              ),
            ],
          ),
          StreamBuilder(
            stream: SharedPreferences.getInstance().asStream(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData &&
                  snapshot.data.getStringList(cont.title) != null) {
                return Container(
                    height: MediaQuery.of(context).size.height * 0.40,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          snapshot.data.getStringList(cont.title).length + 1,
                      itemBuilder: (context, index) {
                        int i = snapshot.data.getStringList(cont.title).length;
                        if (index < i) {
                          String nomeRef =
                              snapshot.data.getStringList(cont.title)[index];
                          return ExerciseCard(
                            nomeRef: nomeRef,
                            nomeRoot: widget.cont.title,
                          );
                        }
                        return AddExercise(
                          cont: cont,
                        );
                      },
                    ));
              }
              return AddExercise(
                cont: cont,
              );
            },
          ),
        ],
      ),
    );
  }


}

List<String> days = [
  ('Lunedì'),
  ('Martedì'),
  ('Mercoledì'),
  ('Giovedì'),
  ('Venerdì'),
  ('Sabato'),
  ('Domenica')
];
