import 'package:flutter/material.dart';
import 'package:relogioglobal/services/horas_mundo.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Carregar extends StatefulWidget {
  const Carregar({super.key});
  _CarregarState createState() => _CarregarState();
}

class _CarregarState extends State<Carregar> {
  void setupHorasMundo() async {
    Horas_Mundo instance = Horas_Mundo(
        location: "Berlin", flag: "germany.png", url: "Europe/Berlin");
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
    });
  }

  @override
  void initState() {
    super.initState();
    setupHorasMundo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
