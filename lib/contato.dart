import 'package:agenda/listagem.dart';

class ContatosRepository {
  final List<Contato> contatos = [];

  void addContatos(Contato c) {
    contatos.add(c);
  }

  List<Contato> getContatos() {
    return contatos;
  }

  void addcontatos(Contato contato) {}

}