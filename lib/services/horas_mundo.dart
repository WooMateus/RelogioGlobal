import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class Horas_Mundo {
  String location; // Variavel Localização
  String time = ""; // Variavel tempo
  String flag; // Variavel Bandeira
  String url; // Variavel URL

  Horas_Mundo(
      {required this.location,
      required this.flag,
      required this.url}); // Construtor

  Future<void> getTime() async {
    try {
      //Catch Block
      Response response = await get(Uri.parse(
          "https://worldtimeapi.org/api/timezone/$url")); // API WorldTimeAPI que disponibiliza os horários
      Map data = jsonDecode(response.body);
      //print(data);

      String datetime = data['datetime']; // Obter a data e hora do mundo
      String offset = data['utc_offset'].substring(0, 3); // Extrai as horas
      //print("Datetime: $datetime");
      //print("Offset: $offset");

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Erro aconteceu: $e');
      time = "Erro no atributo Time";
    }
  }
}
