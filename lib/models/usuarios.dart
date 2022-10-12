import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  int? id;
  final String nome;
  final String email;
  final String senha;
  final String telefone;
  final bool admin;

  DocumentReference? reference;

  Usuario({
    this.id,
    required this.nome,
    required this.email,
    required this.senha,
    required this.telefone,
    required this.admin
  });

  Usuario.fromMap(Map<String, dynamic> map, {this.reference})
      : nome = map['nome'],
        email = map['email'],
        telefone = map['telefone'],
        senha = map['senha'],
        admin = map['admin'];

  Usuario.fromSnapshot(QueryDocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
            reference: snapshot.reference);

  Map<String, dynamic> toJson() =>
      {"nome": nome, "email": email, "telefone": telefone, "senha": senha, "admin": admin};
}
