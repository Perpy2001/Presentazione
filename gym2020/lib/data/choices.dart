import 'package:flutter/material.dart';

List<Content> choices = [
  Content(title: 'Schiena', image: AssetImage('lib/assets/schiena.jpg')),
  Content(title: 'Spalle', image: AssetImage('lib/assets/spalle.jpg')),
  Content(title: 'Bicipiti', image: AssetImage('lib/assets/biceps.jpg')),
  Content(title: 'Tricipiti', image: AssetImage('lib/assets/tyceps.jfif')),
  Content(title: 'Petto', image: AssetImage('lib/assets/chest.jfif')),
  Content(title: 'Gambe', image: AssetImage('lib/assets/leg.jpg')),
];

class Content {
  String date;
  List<Esercizi> esercizi;
  Content({this.title, this.image});
  final String title;
  final AssetImage image;

  void setDate(String newDate) {
    date = newDate;
  }

  void addEsercizio(Esercizi es) => esercizi.add(es);
}

class Esercizi {
  String nome;
  String nRep;
  String nSer;
  Esercizi({this.nome, this.nSer, this.nRep});

  void setNom(String nm) {
    nome = nm;
  }

  void setRep(String rep) {
    nRep = rep;
  }

  void setSer(String ser) {
    nSer = ser;
  }
}
