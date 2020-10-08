
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  // VARIAVEIS
  final _tgarcon = TextEditingController();
  final _tpessoas = TextEditingController();
  final _tvalor = TextEditingController();

  var _infoText = "Informe os dados!";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Racha Conta"),
        centerTitle: true,
      ),
      body: body(),
    );
  }



  body() {
    return SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: Form(

          child: Column(
            children: <Widget>[

              _editText("Valor total da compra", _tvalor),
              _editText("Quantidade de Pessoas", _tpessoas),
              _editText("Porcentagem do garçon", _tgarcon),

              _buttonCalcular(),
              _textInfo(),
            ],
          ),
        ));
  }

  // Widget text
  _editText(String field, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontSize: 22,
        color: Colors.blue,
      ),
      decoration: InputDecoration(
        labelText: field,
        labelStyle: TextStyle(
          fontSize: 22,
          color: Colors.grey,
        ),
      ),
    );
  }



  // Widget button
  _buttonCalcular() {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 20),
      height: 45,
      child: RaisedButton(
        color: Colors.blue,
        child:
        Text(
          "Calcular",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        onPressed: () {

          _calculate();

        },
      ),
    );
  }

  // PROCEDIMENTO PARA CALCULAR A DIVISÃO DE CONTA + A PORCENTAGEM DO GARÇON
  void _calculate(){
    setState(() {

      double valor = double.parse(_tvalor.text);
      double garcon = double.parse(_tgarcon.text);
      double pessoas = double.parse(_tpessoas.text);

      double result = (valor * garcon) / 100; // ENCONTRA O VALOR DA PORCENTAGEM
      double resultado = (result + valor) / pessoas ; // SOMA O VALOR DA PORCENTAGEM + A CONTA TOTAL E DIVIDE PELO NÚMERO DE PESSOAS
      String resulStr = resultado.toStringAsPrecision(4);

      _infoText = "valor a ser pago ($resulStr)" ;// retorna o valor final

    });
  }

  // // Widget text
  _textInfo() {
    return Text(
      _infoText,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.blue, fontSize: 25.0),
    );
  }
}
