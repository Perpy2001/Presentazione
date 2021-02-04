import 'package:flutter/material.dart';
import 'package:gym2020/data/choices.dart';
import 'package:gym2020/pages/crono.dart';

import 'package:gym2020/widget/homecard.dart';
import 'package:gym2020/widget/page2Card.dart';

class Home extends StatelessWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _controller = ScrollController();
    return Scaffold(
      backgroundColor: Color.fromRGBO(186, 182, 182, 10),
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.redAccent[700],
            expandedHeight: 125.0,
            floating: true, //change is here
            pinned: true, //change si
            snap: true,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.access_alarm),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CronoPage()));
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  "GYM2020",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                background: Image.asset(
                  'lib/assets/gym.jpg',
                  fit: BoxFit.cover,
                )),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                height: MediaQuery.of(context).size.height * 0.60,
                child: GridView.count(
                  scrollDirection: Axis.horizontal,
                  crossAxisCount: 2,
                  children: List.generate(choices.length, (index) {
                    return Contentcard(
                      cont: choices[index],
                    );
                  }),
                  //childCount: choices.length,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.80,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(5, 5),
                        blurRadius: 1.0,
                        spreadRadius: 1.0)
                  ],
                  color: Colors.redAccent[700],
                ),
                height: 50,
                child: Center(
                  child: Text(
                    'I Tuoi Massimali',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 8),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.60,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: ListView(
                        addAutomaticKeepAlives: false,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Page2Card(
                            nome: 'stacco',
                          ),
                          Page2Card(
                            nome: 'panca',
                          ),
                          Page2Card(nome: 'squat')
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
