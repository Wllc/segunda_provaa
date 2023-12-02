import 'dart:convert';

Disciplina disciplinaFromJson(String str) => Disciplina.fromJson(json.decode(str));

String disciplinaToJson(Disciplina data) => json.encode(data.toJson());

class Disciplina {
    int id;
    String nome;
    String professor;
    int cargaHoraria;
    int sala;
    int periodo;
    String codigo;

    Disciplina({
        required this.id,
        required this.nome,
        required this.professor,
        required this.cargaHoraria,
        required this.sala,
        required this.periodo,
        required this.codigo,
    });

    factory Disciplina.fromJson(Map<String, dynamic> json) => Disciplina(
        id: json["id"],
        nome: json["nome"],
        professor: json["professor"],
        cargaHoraria: json["cargaHoraria"],
        sala: json["sala"],
        periodo: json["periodo"],
        codigo: json["codigo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "professor": professor,
        "cargaHoraria": cargaHoraria,
        "sala": sala,
        "periodo": periodo,
        "codigo": codigo,
    };
}

