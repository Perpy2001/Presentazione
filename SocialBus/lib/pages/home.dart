import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prova/data_storage/apirutes.dart';
import 'package:prova/data_storage/userData.dart';
import 'package:prova/service/graphicFn.dart';
import 'package:prova/widget/containerbus.dart';
import 'package:prova/widget/menu.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Home extends StatefulWidget {
  final UserData user;
  Home({Key key, this.user}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<List<APIRoute>> buses = [];
  Icon _searchIcon = Icon(Icons.search);
  Widget _appBarTitle = Text("SocialBus");
  List<List<APIRoute>> filteredRoutes = List();
  String _searchText = "";

  final TextEditingController _filter = TextEditingController();

  _HomeState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredRoutes = buses;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
            backgroundColor: Colors.blueAccent,
            drawer: Menu(
              user: widget.user,
              buses: buses,
            ),
            appBar: AppBar(
              backgroundColor: hexToColor("#0058A5"),
              elevation: 0.0,
              title: _appBarTitle,
              actions: <Widget>[
                IconButton(
                  icon: _searchIcon,
                  onPressed: () {
                    _searchPressed();
                  },
                )
              ],
            ),
            body: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  // Box decoration takes a gradient
                  color: Colors.grey[200],
                ),
                child: Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.90,
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                              0,
                              25,
                              0,
                              0,
                            ),
                            //builder di "container_bus da flie json"
                            child: Stack(children: <Widget>[
                              Center(
                                  child: Hero(
                                      tag: 'logo',
                                      child: Image.asset(
                                          "assets/image/logo.png"))),
                              FutureBuilder(
                                  future: loadRoutes(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (_searchText.isNotEmpty) {
                                        buses = buses
                                            .where((r) => r[0]
                                                .routeShortName
                                                .toLowerCase()
                                                .contains(
                                                    _searchText.toLowerCase()))
                                            .toList();
                                      }
                                      return new ListView.builder(
                                        itemCount: buses.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final List<APIRoute> routes =
                                              buses[index];
                                          return ContainerBus(
                                            bus: routes,
                                            user: widget.user,
                                          );
                                        },
                                      );
                                    } else if (snapshot.hasError) {
                                      return new Text("${snapshot.error}");
                                    }
                                    return new SpinKitWanderingCubes(
                                      color: Colors.green[700],
                                      size: 50.0,
                                    );
                                  })
                            ])))))));
  }

//routes asset Json file
  Future<String> _loadRutesAsset() async {
    return await rootBundle.loadString('assets/json/routes.json');
  }

//jsons file to list of ApiRoutes
  Future<List<APIRoute>> loadRoutes() async {
    wait(30);
    buses = [];
    String jsonString = await _loadRutesAsset();
    final Iterable jsonResponse = json.decode(jsonString);
    List<APIRoute> routes = [];
    routes = jsonResponse.map((route) => APIRoute.fromJson(route)).toList();
    List<APIRoute> busList = [];
    for (int i = 0; i < routes.length - 1; i++) {
      busList.add(routes[i]);
      if (routes[i].routeShortName != routes[i + 1].routeShortName) {
        busSorting(busList);
        busList = [];
      }
    }
    return routes;
  }

  void busSorting(List<APIRoute> busList) {
    for (int i = 0; i < busList.length - 1; i++) {
      if (busList[i].routeLongName == busList[i + 1].routeLongName) {
        busList.removeAt(i + 1);
        i--;
      }
    }
    buses.add(busList);
  }

  Future wait(int seconds) {
    return new Future.delayed(Duration(seconds: seconds), () => {});
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = Icon(Icons.close);
        this._appBarTitle = TextField(
          style: new TextStyle(color: Colors.white),
          controller: _filter,
          autofocus: true,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: Colors.white),
            hintText: "Cerca",
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
          ),
        );
      } else {
        this._searchIcon = Icon(Icons.search);
        this._appBarTitle = Text('SocialBus');
        //filteredNames = names;
        _filter.clear();
      }
    });
  }
}
