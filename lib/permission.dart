import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerScreen extends StatefulWidget {
  @override
  _PermissionHandlerPageState createState() => _PermissionHandlerPageState();
}

class _PermissionHandlerPageState extends State<PermissionHandlerScreen> {
  String _cameraPermissionStatus = "Unknown";
  String _locationPermissionStatus = "Unknown";

  // Méthode pour vérifier et demander la permission de la caméra
  Future<void> _checkCameraPermission() async {
    PermissionStatus status = await Permission.camera.request();
    setState(() {
      _cameraPermissionStatus = status.isGranted
          ? "Granted"
          : status.isDenied
              ? "Denied"
              : "Restricted";

      if (_cameraPermissionStatus == "Denied") {
        openAppSettings();
      }
    });
  }

  // Méthode pour vérifier et demander la permission de localisation
  Future<void> _checkLocationPermission() async {
    PermissionStatus status = await Permission.location.request();
    setState(() {
      _locationPermissionStatus = status.isGranted
          ? "Granted"
          : status.isDenied
              ? "Denied"
              : "Restricted";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestion des Permissions'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Statut de la permission de la caméra : $_cameraPermissionStatus',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _checkCameraPermission,
              child: const Text('Vérifier Permission Caméra'),
            ),
            const SizedBox(height: 20),
            Text(
              'Statut de la permission de localisation : $_locationPermissionStatus',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _checkLocationPermission,
              child: const Text('Vérifier Permission Localisation'),
            ),
          ],
        ),
      ),
    );
  }
}
