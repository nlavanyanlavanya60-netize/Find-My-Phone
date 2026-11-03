import '../models/device_model.dart';

class DeviceService {
  static final List<Device> _devices = [
    const Device(
      id: 'dev_01',
      name: "Lavanya's Pixel 7",
      model: "Google Pixel 7 Pro",
      batteryLevel: 84,
      isOnline: true,
      lastSeen: "Just now",
      latitude: 12.9716,
      longitude: 77.5946,
      address: "Anna Salai, Chennai, Tamil Nadu",
    ),
    const Device(
      id: 'dev_02',
      name: "Galaxy Tab S8",
      model: "Samsung Galaxy Tab S8+",
      batteryLevel: 45,
      isOnline: true,
      lastSeen: "12 mins ago",
      latitude: 12.9780,
      longitude: 77.5990,
      address: "OMR Road, Sholinganallur, Chennai",
    ),
    const Device(
      id: 'dev_03',
      name: "Work iPhone 13",
      model: "Apple iPhone 13",
      batteryLevel: 19,
      isOnline: false,
      lastSeen: "Yesterday at 18:42",
      latitude: 12.9600,
      longitude: 77.5800,
      address: "Guindy Industrial Estate, Chennai",
    ),
  ];

  static List<Device> getDevices() => _devices;

  static Device? getDeviceById(String id) {
    try {
      return _devices.firstWhere((d) => d.id == id);
    } catch (_) {
      return null;
    }
  }
}
