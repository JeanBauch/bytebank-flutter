import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';

import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferência';

const _rotuloCampoNumeroConta = 'Número da conta';
const _dicaCampoNUmeroConta = '0000';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '00.00';
const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatelessWidget {
  FormularioTransferencia({ Key? key }) : super(key: key);

  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_tituloAppBar),),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(controlador: _controladorCampoNumeroConta, dica: _dicaCampoNUmeroConta, rotulo: _rotuloCampoNumeroConta),
            Editor(controlador: _controladorCampoValor, dica: _dicaCampoValor, rotulo: _rotuloCampoValor, icone: Icons.monetization_on),
          
            ElevatedButton(
              child: const Text(_textoBotaoConfirmar), 
              onPressed: () => _criaTransferencia(context),
            ), 
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);

    if(numeroConta != null && valor != null){
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
