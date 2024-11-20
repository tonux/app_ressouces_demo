import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class GeolocatorExamplePage extends StatefulWidget {
  @override
  _GeolocatorExamplePageState createState() => _GeolocatorExamplePageState();
}

class _GeolocatorExamplePageState extends State<GeolocatorExamplePage> {
  String _locationMessage = "Appuyez sur 'Obtenir la localisation'";

  // Méthode pour demander la localisation
  Future<void> _getCurrentLocation() async {
    // Vérification de la permission de localisation
    PermissionStatus permissionStatus = await Permission.location.request();
    if (permissionStatus.isGranted) {
      // Obtention de la position actuelle
      Position position = await Geolocator.getCurrentPosition();
      setState(() {
        _locationMessage =
            "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
      });
    } else {
      setState(() {
        _locationMessage = "Permission de localisation refusée";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemple de Geolocator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _locationMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getCurrentLocation,
              child: const Text('Obtenir la localisation'),
            ),
          ],
        ),
      ),
    );
  }
}
