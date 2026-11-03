class Device {
  final String id;
  final String name;
  final String model;
  final int batteryLevel;
  final bool isOnline;
  final String lastSeen;
  final double latitude;
  final double longitude;
  final String address;

  const Device({
    required this.id,
    required this.name,
    required this.model,
    required this.batteryLevel,
    required this.isOnline,
    required this.lastSeen,
    required this.latitude,
    required this.longitude,
    required this.address,
  });
}
