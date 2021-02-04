import 'package:flutter/material.dart';
import 'package:prova/data_storage/apirutes.dart';
import 'package:prova/data_storage/userData.dart';
import 'package:prova/service/graphicFn.dart';
import 'package:prova/widget/containerbus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferedBus extends StatefulWidget {
  final List<List<APIRoute>> buses;
  final UserData user;
  PreferedBus({Key key, this.buses, this.user}) : super(key: key);

  @override
  _PreferedBusState createState() => _PreferedBusState();
}

class _PreferedBusState extends State<PreferedBus> {
  SharedPreferences prefs;
  List<List<APIRoute>> buses;
  void setPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  List<APIRoute> routes = [];
  @override
  void initState() {
    setPref();
    buses = widget.buses;
    for (int i = 0; i < buses.length; i++) {
      if (prefs.getBool(buses[i][0].routeShortName) == null) {
        buses.removeAt(i);
      } else if (!prefs.getBool(buses[i][0].routeShortName)) {
        buses.removeAt(i);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: hexToColor("#0058A5"),
          title: Row(children: <Widget>[
            Icon(
              Icons.directions_bus,
            ),
            Text(
              'SocialBus',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ]),
        ),
        body: Container(
            child: ListView.builder(
          itemCount: buses.length,
          itemBuilder: (BuildContext context, int index) {
            routes = buses[index];
            if (buses.length > 0) {
              return ContainerBus(
                bus: routes,
                user: widget.user,
              );
            } else {
              return Center(
                child: Container(
                  child: Text("Nessun bus trovato"),
                ),
              );
            }
          },
        )));
  }
}
