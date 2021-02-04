import 'package:flutter/material.dart';
import 'package:prova/data_storage/apirutes.dart';
import 'package:prova/data_storage/userData.dart';
import 'package:prova/service/graphicFn.dart';
import 'package:prova/widget/containerbus.dart';

class SerchedBus extends StatefulWidget {
  final List<List<APIRoute>> buses;
  final String serced;
  final UserData user;
  SerchedBus({Key key, this.buses, this.serced, this.user}) : super(key: key);

  @override
  _SerchedBusState createState() => _SerchedBusState();
}

class _SerchedBusState extends State<SerchedBus> {
  List<APIRoute> routes = [];
  @override
  void initState() {
    List<List<APIRoute>> buses = widget.buses;
    for (int i = 0; i < buses.length; i++) {
      if (buses[i][0].routeShortName == widget.serced) {
        routes = (buses[i]);
        print(routes);
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
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
          if(routes.length>0){
            return ContainerBus(
              bus: routes,
              user: widget.user,
            );
          }else {
            return Center(
              child: Container(child: Text("Nessun bus trovato"),),
            );
            
            }},
        )));
  }
}
