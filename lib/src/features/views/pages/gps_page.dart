import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GpsPage extends StatefulWidget {
  const GpsPage({super.key});

  @override
  _GpsPageState createState() => _GpsPageState();
}

class _GpsPageState extends State<GpsPage> {
  String lokasi = "Menunggu lokasi...";

  Future<void> _getLokasi() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          lokasi = "Izin lokasi ditolak.";
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        lokasi = "Izin lokasi ditolak secara permanen.";
      });
      return;
    }

    Position posisi = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      lokasi = "Latitude: ${posisi.latitude}, Longitude: ${posisi.longitude}";
    });
  }

  @override
  void initState() {
    super.initState();
    _getLokasi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GPS Lokasi")),
      body: Center(child: Text(lokasi, style: TextStyle(fontSize: 20))),
    );
  }
}
