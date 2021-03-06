import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

import 'formulario.dart';

const _tituloAppBar = 'TransferĂȘncias';

class ListaTransferencia extends StatefulWidget {

  ListaTransferencia({Key? key}) : super(key: key);
  final List<Transferencia?> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }

}

class ListaTransferenciaState extends State<ListaTransferencia> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia!);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return FormularioTransferencia();
          })).then(
            (transferenciaRecebida) => _atualiza(transferenciaRecebida)
          );
        },
      ),
    );
  }

  void _atualiza(Transferencia? transferenciaRecebida) {
    if(transferenciaRecebida != null) {
      setState(() {
        widget._transferencias.add(transferenciaRecebida);
      });
    }
  }
}

class ItemTransferencia extends StatelessWidget {
  
  final Transferencia _transferencia;

  // ignore: use_key_in_widget_constructors
  const ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      )
    );

  }

}
