import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(DSIApp());
}

class DSIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DSI App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DSIPage(title: 'My First App - DSI/BSI/UFRPE'),
    );
  }
}

class DSIPage extends StatefulWidget {
  final String title;

  DSIPage({Key key, this.title}) : super(key: key);

  @override
  _DSIPageState createState() => _DSIPageState();
}

class _DSIPageState extends State<DSIPage> {
  final _warnings = [
    'JÁ DEU BENÇA!',
    'VAI QUEBRAR O CELULAR!',
    'PARA VÉI!',
    'QUE DEDO NERVOSO!',
    'PRA QUE ISSO?!',
    'DEIXA DE GRAÇA!',
  ];
  int _counter = 0;
//  int _counter1=0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _decrementCounter(){
    setState(() {
      _counter--;
    });
  }

  String _getCountText() {
    return 'Você clicou $_counter vezes no botão.';
  }

//  String _getCountTextD(){
//    return 'Você clicou $_counter1 vezes no botão de decremento.';
//  }

  String _getWarningText() {
    String result = '';
    if (_counter > 5) {
      var idx = Random().nextInt(_warnings.length);
      result = _warnings[idx];
    }
    return result;
  }

  String _getImageName() {
    //abra o arquivo 'pubspec.yaml' e veja as entradas na seção 'assets'.
    //para incluir novas imagens, basta incluir novas entradas nesta seção.
    String result;
    if (_counter == 0) {
      result = '';
    } else if (_counter > 5) {
      result = 'images/jadeu.png';
    } else if (_counter > 2) {
      result = 'images/thug2.gif';
    } else {
      result = 'images/thug1.jpg';
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text(widget.title),
            Spacer(),
            Image(image: AssetImage('images/logo/bsi-white.png'), height: 32),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: <Widget>[
              DSIMainBodyWidget(
                  _getCountText(), _getWarningText(), _getImageName()),
              Spacer(),
              FlatButton(
                onPressed: _resetCounter,
                color: Colors.deepOrangeAccent,
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                child: Text(
                  'Resetar',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            backgroundColor: Colors.green,
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 3.0,
          ),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            backgroundColor: Colors.red,
            child: Icon(Icons.remove),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class DSIMainBodyWidget extends StatelessWidget {
  final String _countText;
//  final String _countTextD;
  final String _warningText;
  final String _image;
  DSIMainBodyWidget(this._countText, this._warningText, this._image);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          _countText,
          style: TextStyle(color: Colors.black, fontSize: 16.0),
        ),
//        SizedBox(height: 8.0),
//        if (_countTextD.isNotEmpty)
//        Text(
//          _countTextD,
//          style: TextStyle(color: Colors.black, fontSize: 16.0),
//        ),
        SizedBox(height: 8.0),
        if (_warningText.isNotEmpty)
          Text(
            _warningText,
            style: TextStyle(color: Colors.red, fontSize: 24.0),
          ),
        SizedBox(height: 8.0),
        if (_image.isNotEmpty)
          Image(
            image: AssetImage(_image),
            height: 240,
          ),
      ],
    );
  }
}
