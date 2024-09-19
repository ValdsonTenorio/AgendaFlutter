import 'package:agenda/listagem.dart';

class ContatosRepository {
  final List<Contato> contatos = [];

  void addContatos(Contato c) {
    contatos.add(c);
  }
  void rmvContatos(Contato c){
    contatos.remove(c);
  }

  List<Contato> getContatos() {
    return contatos;
  }
}