// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controllerAlcool = TextEditingController();
  final TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado = 'Invalid number, type numbers greather than 0 and using (.)';
      });
    } else {
      /*
      * Se o preço do álcool divido pelo preço da gasolina
      * for >= a 0.7 é melhor abastecer com gasolina
      * senão é melhor utilizar álcool
      * */
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _textoResultado = "It's better use gasoline";
        });
      } else {
        setState(() {
          _textoResultado = "It's better use alchool";
        });
      }
      //_limparCampos();
    }
  }

  // void _limparCampos(){
  //   _controllerGasolina.text = "";
  //   _controllerAlcool.text = "";
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alchool Or Gasoline'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Image.asset('images/logo.png'),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                'Know the best option for fueling your car',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Alchool price, ex: 1.59'),
              style: const TextStyle(fontSize: 22),
              controller: _controllerAlcool,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Gasoline price, ex: 3.59"),
              style: const TextStyle(fontSize: 22),
              controller: _controllerGasolina,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                padding: const EdgeInsets.all(15),
                onPressed: _calcular,
                child: const Text(
                  'Calculate',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                _textoResultado,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
