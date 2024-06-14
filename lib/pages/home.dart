import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    try {
      data = data.isNotEmpty
          ? data
          : ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    } catch (e) {
      data = data;
    }
    print(data);

    return Scaffold(
      backgroundColor: Color(0xFFFFA500),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/localizacao');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'flag': result['flag']
                    };
                  });
                },
                icon: Icon(Icons.edit_location),
                label: Text("Trocar a localização"),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data["location"],
                    style: TextStyle(fontSize: 28.0, letterSpacing: 2.0),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
