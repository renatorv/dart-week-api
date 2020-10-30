// O plugin Flutter Helpers, gera todo o código dessa classe
// jsf: faz o importe necessário e cria o part
// jsc: cria a estrutura da classe, bastando colocar o nome da classe e depois criar os atributos e o construtor

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String name;
  final String email;
  final String password;

  User({
    this.id,
    this.name,
    this.email,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
