import 'package:flutter/material.dart';
import 'taxi.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TAXI'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Pesan'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TaxiFormPage()),
            );
          },
        ),
      ),
    );
  }
}
