import 'package:flutter/material.dart';
import 'package:prova/data_storage/apirutes.dart';
import 'package:prova/data_storage/userData.dart';
import 'package:prova/pages/home.dart';
import 'package:prova/pages/peferiti.dart';
import 'package:prova/service/graphicFn.dart';

class Menu extends StatelessWidget {
  final UserData user;
  final  List<List<APIRoute>> buses;
  const Menu({Key key, this.user, this.buses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          
             new UserAccountsDrawerHeader(
              accountName: new Text(user.userName),
              accountEmail: new Text(user.user),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new NetworkImage("https://iupac.org/wp-content/uploads/2018/05/default-avatar.png"),
              ),
              decoration: BoxDecoration(color: hexToColor("#0058A5")),
            ),
            
          
          ListTile(
            leading: Icon(
              Icons.star_border,
              color: Colors.grey[700],
              ),
            
            title: Text('Preferiti'),
            onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PreferedBus(user: user,buses: buses,)),
                );
              },
          ),
          ListTile(
            leading: Icon(
              Icons.mode_edit,
              color: Colors.grey[700],
              ),
            title: Text('Scrivi'),
            onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
          ),
          ListTile(
            leading: Icon(
              Icons.access_time,
              color: Colors.grey[700],
              ),
            title: Text('Orari'),
            onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
          ),
          ListTile(
            leading: Icon(
              Icons.assignment,
              color: Colors.grey[700],
              ),
            title: Text('Comunicazioni'),
            onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
          ),
          ListTile(
            leading: Icon(
              Icons.cloud_queue,
              color: Colors.grey[700],
              ),
            title: Text('Sito'),
            onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
          ),
        ],
      ),
    );
  }
}
