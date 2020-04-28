import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'input.widget.dart';
import 'loading-button.widget.dart';

class SubmitForm extends StatelessWidget {
  var gasolinaControler = new MoneyMaskedTextController();
  var alcoolControler = new MoneyMaskedTextController();
  var rendAlcoolControler = new MoneyMaskedTextController();
  var rendGasolinaControler = new MoneyMaskedTextController();
  var busy = false;
  Function submitFunction;

  SubmitForm({
    @required this.gasolinaControler,
    @required this.alcoolControler,
    @required this.busy,
    @required this.submitFunction,
    @required this.rendAlcoolControler,
    @required this.rendGasolinaControler,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(
            controler: gasolinaControler,
            label: "Gasolina:",
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(
            controler: alcoolControler,
            label: "Álcool:",
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(
            controler: rendGasolinaControler,
            label: "Rendimento Gasolina:",
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(
            controler: rendAlcoolControler,
            label: "Rendimento Álcool:",
          ),
        ),
        SizedBox(
          height: 25,
        ),
        LoadingButton(
          busy: busy,
          func: submitFunction,
          text: "CALCULAR",
          invert: false,
        ),
      ],
    );
  }
}
