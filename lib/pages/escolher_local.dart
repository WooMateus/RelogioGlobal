import 'package:flutter/material.dart';
import 'package:relogioglobal/services/horas_mundo.dart';

class EscolherLocal extends StatefulWidget {
  const EscolherLocal({super.key});
  _EscolherLocalState createState() => _EscolherLocalState();
}

class _EscolherLocalState extends State<EscolherLocal> {
  List<Horas_Mundo> locations = [
    Horas_Mundo(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    Horas_Mundo(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    Horas_Mundo(
        url: 'America/Fortaleza',
        location: 'Brasil',
        flag: 'brazil.png'), // FALTA FAZER
    Horas_Mundo(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    Horas_Mundo(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    Horas_Mundo(
        url: 'America/New_York', location: 'Nova York', flag: 'usa.png'),
    Horas_Mundo(
        url: 'Asia/Tokyo', location: 'Tokyo', flag: 'japan.png'), // FALTA FAZER
    Horas_Mundo(
        url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    Horas_Mundo instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        title: Text("Selecione a Localização",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                ),
              ),
            );
          }),
    );
  }
}
