import 'dart:convert';

class Despesas {
  final String? id_banco;
  final String? descricao;
  final double? valor;
  final String? data;

  Despesas({
    this.id_banco,
    this.descricao,
    this.valor,
    this.data,
  });

  factory Despesas.toJson(Map<String, dynamic> json) {
    return Despesas(
        descricao: json['descricao'], valor: json['valor'], data: json['data']);
  }

  factory Despesas.fromJson(Map<String, dynamic> json) {
    return Despesas(
        id_banco: json['id_banco'],
        descricao: json['descricao'],
        valor: json['valor'],
        data: json['data']);
  }

  // String toString() {
  //   return "descricao: $descricao, valor: $valor, data: $data";
  //  }

}
