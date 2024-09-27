import 'package:agenda/cadastro.dart';
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
  final TextEditingController emailController = TextEditingController(); //Instância de objetos
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
        itemBuilder: (context, index) { // Recupera o contato correspondente ao índice atual
          Contato c = contatos.getContatos()[index];
          return ListTile(
            title: Text(
              c.nome,//Pega o nome e coloca como titulo
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Column(//Coluna com os dados
              crossAxisAlignment: CrossAxisAlignment.start,// Alinha à esquerda.
              children: [
                Text(c.email), 
                Text(c.telefone),
              ],//Um vetor para os subtitulo
            ),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [//Um vetor de botões em uma coluna
              FilledButton(
                  onPressed: () {
                    setState(() {
                      contatos.rmvContatos(c);//Chama a classe de remover contatos
                    });
                  },
                  child: Text('Deletar')),
              SizedBox(
                width: 10,
              ),
              FilledButton(
                  onPressed: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Cadastro(
                                    contatos: contatos,
                                    contato: c,
                                  ))).then(
                          (contato) => setState(() {
                            contatos.attcontato(index, contato);//Chama a classe para atualizar contatos
                          }));
                  },
                  child: Text('Editar'))
            ]),
          );
        },
      ),
    );
  }
}
