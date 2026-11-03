import 'package:flutter/material.dart';
import '../models/device_model.dart';

class DeviceDetailScreen extends StatelessWidget {
  final Device device;

  const DeviceDetailScreen({super.key, required this.device});

  void _showActionSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(device.name),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 220,
              width: double.infinity,
              color: Colors.blueGrey.shade100,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 48,
                      color: Colors.blue.shade700,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      device.address,
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Lat: ${device.latitude}, Lon: ${device.longitude}",
                      style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Quick Security Actions", style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _actionButton(
                        context,
                        icon: Icons.volume_up,
                        label: "Play Sound",
                        color: Colors.blue,
                        onPressed: () => _showActionSnackbar(context, "Playing sound at maximum volume..."),
                      ),
                      _actionButton(
                        context,
                        icon: Icons.lock_outline,
                        label: "Secure Device",
                        color: Colors.orange,
                        onPressed: () => _showActionSnackbar(context, "Device locked with secure PIN."),
                      ),
                      _actionButton(
                        context,
                        icon: Icons.delete_forever,
                        label: "Erase Data",
                        color: Colors.red,
                        onPressed: () => _showActionSnackbar(context, "Remote wipe command dispatched."),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text("Device Information", style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  _infoTile("Model", device.model),
                  _infoTile("Status", device.isOnline ? "Online" : "Offline"),
                  _infoTile("Battery", "${device.batteryLevel}%"),
                  _infoTile("Last Location Update", device.lastSeen),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionButton(BuildContext context, {required IconData icon, required String label, required Color color, required VoidCallback onPressed}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: color.withOpacity(0.15),
          child: IconButton(
            icon: Icon(icon, color: color),
            onPressed: onPressed,
          ),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _infoTile(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey.shade700)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
