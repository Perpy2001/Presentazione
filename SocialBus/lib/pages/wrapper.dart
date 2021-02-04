import 'package:flutter/material.dart';
import 'package:prova/service/graphicFn.dart';
import 'login_register.dart';

class Wrapper extends StatelessWidget {
  static const String id = "HOMESCREEN";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Stack(
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height * 0.65,
                decoration: BoxDecoration(color: hexToColor("#0058A5"))),
            Container(
             height: MediaQuery.of(context).size.height * 0.52,
              margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.25,),
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.17,
                ),
                Text(
                  'SocialBus',
                  style: TextStyle(
                    letterSpacing: 5,
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.46,
                    child: Hero(
                        tag: 'logo',
                        child: Image.asset("assets/image/logo.png")),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.20,
                ),
                Text("Hai gia un accaunt:"),
                CustomButton(
                  text: "Log In",
                  callback: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                ),
                Text("Nuovo utente:"),
                CustomButton(
                  text: "Registrati",
                  callback: () {
                    Navigator.of(context).pushNamed('/registration');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
