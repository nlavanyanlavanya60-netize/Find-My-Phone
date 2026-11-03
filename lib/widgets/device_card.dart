import 'package:flutter/material.dart';
import '../models/device_model.dart';
import '../screens/device_detail_screen.dart';

class DeviceCard extends StatelessWidget {
  final Device device;

  const DeviceCard({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: device.isOnline ? Colors.green.shade50 : Colors.grey.shade200,
          radius: 26,
          child: Icon(
            device.model.contains("Tab") ? Icons.tablet_android : Icons.smartphone,
            color: device.isOnline ? Colors.green.shade700 : Colors.grey.shade600,
            size: 28,
          ),
        ),
        title: Text(
          device.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text("${device.model} • ${device.address}", maxLines: 1, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  Icons.battery_charging_full,
                  size: 16,
                  color: device.batteryLevel < 20 ? Colors.red : Colors.green,
                ),
                const SizedBox(width: 4),
                Text("${device.batteryLevel}%"),
                const SizedBox(width: 12),
                Icon(
                  Icons.circle,
                  size: 8,
                  color: device.isOnline ? Colors.green : Colors.grey,
                ),
                const SizedBox(width: 4),
                Text(device.isOnline ? "Online" : "Offline", style: TextStyle(color: Colors.grey.shade700)),
              ],
            ),
          ],
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DeviceDetailScreen(device: device),
            ),
          );
        },
      ),
    );
  }
}
