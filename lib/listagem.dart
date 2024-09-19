import 'package:agenda/contato.dart';
import 'package:flutter/material.dart';

class Contato {
  final String nome;
  final String telefone;
  final String email;
  Contato({required this.nome, required this.telefone, required this.email});
}

class Listagem extends StatefulWidget {
  final ContatosRepository contatos;
  Listagem({required this.contatos});

  @override
  State<Listagem> createState() => ListagemState(contatos: contatos);
}

class ListagemState extends State<Listagem> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final ContatosRepository contatos;

  ListagemState({required this.contatos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listagem de Contatos'),
      ),
      body: ListView.builder(
        itemCount: contatos.getContatos().length,
        itemBuilder: (context, index) {
          Contato c = contatos.getContatos()[index];
          return ListTile(
            title: Text(
              c.nome,
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(c.email),
                Text(c.telefone),
              ],
            ),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      contatos.rmvContatos(Contato(
                          nome: nomeController.text,
                          telefone: telefoneController.text,
                          email: emailController.text));
                    });
                  },
                  child: Text('Deletar')),
              SizedBox(width: 10,),
              ElevatedButton(onPressed: () {}, 
              child: Text('Editar'))
            ]),
          );
        },
      ),
    );
  }
}
