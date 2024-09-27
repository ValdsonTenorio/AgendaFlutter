import 'package:agenda/contato.dart';
import 'package:agenda/listagem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class Cadastro extends StatefulWidget {
  final ContatosRepository contatos;
  final Contato? contato;

  Cadastro({required this.contatos, this.contato});

  @override
  State<Cadastro> createState() => _CadastroState(contatos: contatos);
}

class _CadastroState extends State<Cadastro> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController telefoneController =
      MaskedTextController(mask: '(00)00000-0000');//Responsavel por definir a máscara do telefone
  TextEditingController emailController = TextEditingController();//Instância de objetos
  final ContatosRepository contatos;
  _CadastroState({required this.contatos});
  @override
  void initState() {
    super.initState();
    if (widget.contato != null) {
      nomeController = TextEditingController(text: widget.contato!.nome);
      telefoneController = MaskedTextController(
          mask: '(00)00000-0000', text: widget.contato!.telefone);
      emailController = TextEditingController(text: widget.contato!.email);
    }//Condição para o contato ser inicializado
  }

  final _formKey = GlobalKey<FormState>();//Cria um chave
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary, //Define um cor para o topo da página
        title: Text('Cadastro de Contatos'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, // associa a chave ao formulário
            child: Column(
              children: [
                TextFormField(
                    decoration: InputDecoration(labelText: 'Entre com Nome'),
                    controller: nomeController, //Passando os dados do controller para o nomeController
                    validator: (nomeController) { // Propriedade do form que inicia a validação do dado
                      if (nomeController == null || nomeController.isEmpty) {//Condição para validadar a entrada
                        return 'Por Favor, insira o nome';
                      }
                      return null;
                    }),
                TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Entre com o Telefone',
                        hintText: '(XX) XXXXX-XXXX',//Um placeholder para a label
                        hintStyle: TextStyle(color: Colors.grey)),
                    controller: telefoneController,
                    validator: (telefoneController) {
                      if (telefoneController == null ||
                          telefoneController.isEmpty ||
                          telefoneController.length != 14) {
                        return 'Por Favor, insira o Telefone';
                      }//Condição para validadar a entrada do telefone e quantidade de numero
                      return null;
                    }),
                TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Entre com Email',
                    ),
                    controller: emailController,
                    validator: (emailController) {
                      if (emailController == null || emailController.isEmpty) {
                        return 'Por Favor, insira o Email';
                      }//Condição para validadar a entrada
                      if (RegExp(r'^[\w-.]+@([\w-]+.)+[\w-]{2,4}$')
                          .hasMatch(emailController)) {
                        return null;
                      }//Valida se a mascara do email está certa
                      return 'Email invalido';
                    }),
                SizedBox(height: 20),
                FilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {// Responsável por verificar se o contato existe e atualiza os dados
                      if (widget.contato != null) {
                        Navigator.pop(
                            context,
                            Contato(
                                nome: nomeController.text,
                                email: emailController.text,
                                telefone: telefoneController.text));
                      } else {
                        setState(() {
                          contatos.addContatos(Contato(//chama a função e seta os dados dos controladores
                              nome: nomeController.text,
                              email: emailController.text,
                              telefone: telefoneController.text));
                        });
                        Navigator.pop(context);
                      }
                    }
                  },
                  child: Text('Salvar'),
                ),//Botão que salva o processo
              ],
            ),
          )),
    );
  }
}
