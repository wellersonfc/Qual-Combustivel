import 'package:alcool_ou_gasolina/widgets/logo.widget.dart';
import 'package:alcool_ou_gasolina/widgets/submit-form.dart';
import 'package:alcool_ou_gasolina/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _gasolinaControler = new MoneyMaskedTextController();
  var _alcoolControler = new MoneyMaskedTextController();
  var _rendAlcoolControler = new MoneyMaskedTextController();
  var _rendGasolinaControler = new MoneyMaskedTextController();

  var _busy = false;
  var _completed = false;
  var _resultText = "Compensa utilizar Álcool";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: <Widget>[
          Logo(),
          _completed
              ? Success(
                  result: _resultText,
                  reset: reset,
                )
              : SubmitForm(
                  alcoolControler: _alcoolControler,
                  gasolinaControler: _gasolinaControler,
                  rendAlcoolControler: _rendAlcoolControler,
                  rendGasolinaControler: _rendGasolinaControler,
                  submitFunction: calculate,
                  busy: _busy,
                ),
        ],
      ),
    );
  }

  Future calculate() {
    double alc = double.parse(
          _alcoolControler.text.replaceAll(new RegExp(r'[,.]'), ''),
        ) /
        100;
    double gas = double.parse(
          _gasolinaControler.text.replaceAll(new RegExp(r'[,.]'), ''),
        ) /
        100;
    double rendGas = double.parse(
          _rendGasolinaControler.text.replaceAll(new RegExp(r'[,.]'), ''),
        ) /
        100;
    double rendAlc = double.parse(
          _rendAlcoolControler.text.replaceAll(new RegExp(r'[,.]'), ''),
        ) /
        100;
    double res = alc / gas;
    double porcentagem;

    if (rendAlc != 00.00 && rendGas != 00.00) {
      porcentagem = rendAlc / rendGas;
    } else {
      porcentagem = 0.7;
    }

    setState(() {
      _completed = false;
      _busy = true;
    });

    return new Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (res >= porcentagem) {
          _resultText = "Compensa utilizar Gasolina!";
        } else {
          _resultText = "Compensa utilizar Álcool!";
        }
        _busy = false;
        _completed = true;
      });
    });
  }

  reset() {
    setState(() {
      _alcoolControler = new MoneyMaskedTextController();
      _gasolinaControler = new MoneyMaskedTextController();
      _rendAlcoolControler = new MoneyMaskedTextController();
      _rendGasolinaControler = new MoneyMaskedTextController();

      _completed = false;
      _busy = false;
    });
  }
}
