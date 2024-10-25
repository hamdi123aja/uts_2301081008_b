import 'package:flutter/material.dart';
import 'perhitungan.dart';

class TaxiFormPage extends StatefulWidget {
  @override
  _TaxiFormPageState createState() => _TaxiFormPageState();
}

class _TaxiFormPageState extends State<TaxiFormPage> {
  final TextEditingController _kodeTransaksiController = TextEditingController();
  final TextEditingController _kodePenumpangController = TextEditingController();
  final TextEditingController _namaPenumpangController = TextEditingController();
  final TextEditingController _platNomorController = TextEditingController();
  final TextEditingController _supirController = TextEditingController();
  final TextEditingController _biayaAwalController = TextEditingController();
  final TextEditingController _biayaPerKilometerController = TextEditingController();
  final TextEditingController _jumlahKilometerController = TextEditingController();

  String _jenisPenumpang = 'VIP';
  double _totalBayar = 0.0;

  void _calculateFare() {
    double biayaAwal = double.parse(_biayaAwalController.text);
    double biayaPerKilometer = double.parse(_biayaPerKilometerController.text);
    double jumlahKilometer = double.parse(_jumlahKilometerController.text);

    setState(() {
      _totalBayar = calculateTotalBayar(
        jenisPenumpang: _jenisPenumpang,
        biayaAwal: biayaAwal,
        biayaPerKilometer: biayaPerKilometer,
        jumlahKilometer: jumlahKilometer,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TAXI')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _kodeTransaksiController, decoration: InputDecoration(labelText: 'Kode Transaksi')),
            TextField(controller: _kodePenumpangController, decoration: InputDecoration(labelText: 'Kode Penumpang')),
            TextField(controller: _namaPenumpangController, decoration: InputDecoration(labelText: 'Nama Penumpang')),
            TextField(controller: _platNomorController, decoration: InputDecoration(labelText: 'Plat Nomor')),
            TextField(controller: _supirController, decoration: InputDecoration(labelText: 'Supir')),
            TextField(controller: _biayaAwalController, decoration: InputDecoration(labelText: 'Biaya Awal')),
            TextField(controller: _biayaPerKilometerController, decoration: InputDecoration(labelText: 'Biaya Per Kilometer')),
            TextField(controller: _jumlahKilometerController, decoration: InputDecoration(labelText: 'Jumlah Kilometer')),
            DropdownButton<String>(
              value: _jenisPenumpang,
              items: ['VIP', 'GOLD', 'REGULAR'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _jenisPenumpang = newValue!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateFare,
              child: Text('Bayar'),
            ),
            SizedBox(height: 20),
            Text('Total Bayar: Rp$_totalBayar', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
