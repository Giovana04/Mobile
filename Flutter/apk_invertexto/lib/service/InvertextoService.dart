import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class Invertextoservice {
  final String _token = '21539|qPhGURUhZYAvmKp9WeOHm13lLP0yRuZk';

  Future<Map<String, dynamic>> convertePorExtenso(String? valor, String? tipo) async{
    try{
      final uri = Uri.parse('https://api.invertexto.com/v1/number-to-words?token=$_token&number=${valor}&language=pt&currency=${tipo}');
      final response = await http.get(uri);
      if(response.statusCode == 200){
        return json.decode(response.body);
      }
      else{
        throw Exception('Erro ${response.statusCode} : ${response.body}');
      }
    }on SocketException{
      throw Exception('Sem conexão com a internet');
    }catch(e){
      rethrow;
    }
  }

  Future<Map<String, dynamic>> buscaCEP(String? valor) async{
    try{
      final uri = Uri.parse('https://api.invertexto.com/v1/cep/${valor}?token=$_token');
      final response = await http.get(uri);
      if(response.statusCode == 200){
        return json.decode(response.body);
      }
      else{
        throw Exception('Erro ${response.statusCode} : ${response.body}');
      }
    }on SocketException{
      throw Exception('Sem conexão com a internet');
    }catch(e){
      rethrow;
    }
  }

  Future<Map<String, dynamic>> validaCPF(String? valor) async{
    try{
      final uri = Uri.parse('https://api.invertexto.com/v1/validator?token=${_token}&value=${valor}');
      final response = await http.get(uri);
      if(response.statusCode == 200){
        return json.decode(response.body);
      }
      else{
        throw Exception('Erro ${response.statusCode} : ${response.body}');
      }
    }on SocketException{
      throw Exception('Sem conexão com a internet');
    }catch(e){
      rethrow;
    }
  }
}