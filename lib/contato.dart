import 'package:agenda/listagem.dart';

class ContatosRepository {
  final List<Contato> contatos = [];

  void addContatos(Contato c) {//Classe de adicão
    contatos.add(c);
  }

  void rmvContatos(Contato c) {//classe de remoção
    contatos.remove(c);
  }

  void attcontato(int index, Contato c) {//classe que manda o contato atualizado
    contatos[index] = c;
  }
  List<Contato> getContatos() {;//classe de listagem
    return contatos;
  }
}
