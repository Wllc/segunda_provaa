import 'package:flutter/material.dart';

class Disciplina {
    int id = 0;
    String nome = '';
    String professor = '';
    int cargaHoraria = 0;
    int sala = 0;
    int periodo = 0;
    String codigo = '';
    
    static const String disciplinaTable = "disciplinas_table";
    static const String idColumn = "id";
    static const String nomeColumn = "nome";
    static const String professorColumn = "professor";
    static const String cargaHorariaColumn = "cargaHoraria";
    static const String salaColumn = "sala";
    static const String periodoColumn = "periodo";
    static const String codigoColumn = "codigo";

    Disciplina(
         this.nome,
         this.professor,
         this.cargaHoraria,
         this.sala,
         this.periodo,
         this.codigo,
    );

    Disciplina.fromMap(Map map){
        id = map[idColumn];
        nome = map[nomeColumn];
        professor = map[professorColumn];
        cargaHoraria = map[cargaHorariaColumn];
        sala = map[salaColumn];
        periodo = map[periodoColumn];
        codigo = map[codigoColumn];
    }

    Map<String, dynamic> toMap() {
      return{
        nomeColumn: nome,
        professorColumn: professor,
        cargaHorariaColumn: cargaHoraria,
        salaColumn: sala,
        periodoColumn: periodo,
        codigoColumn: codigo,
      };
    }

    @override
    String toString() {
      return 'Disciplinas{nome: $nome, professor: $professor, cargaHoraria: $cargaHoraria, sala: $sala, periodo: $periodo, codigo: $codigo}';
    }
}

