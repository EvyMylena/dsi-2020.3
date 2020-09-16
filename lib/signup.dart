
import 'package:dsi_app/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.white,
          onPressed: ()=> Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(),
            ),
          ),
        ),
        title: Text('Home'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 22, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              alignment: Alignment(0.0,1.15),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: AssetImage('images/logo/bsi.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
              child: Container(
                height: 46,
                width: 46,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3,1.0],
                    colors: [
                      Colors.green,
                    ],
                  ),
                  border: Border.all(
                    width: 4.0,
                    color: const Color(0xFFFFFFFF),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(56),
                  ),
                ),
                child: SizedBox.expand(
                  child: FlatButton(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: (){},
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Login",
                labelStyle: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Confirmação de Senha",
                labelStyle: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  child: Text(
                      "Cadastrar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: (){},
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 20,
              alignment: Alignment.center,
              child: FlatButton(
                child: Text(
                    "Cancelar",
                  textAlign: TextAlign.center,
                ),
                onPressed: () => Navigator.pop(context, false),
              ),
            )
          ],
        ),
      ),
    );
  }
}
