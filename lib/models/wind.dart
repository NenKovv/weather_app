class Wind {
  final double speed;
  final int degree;

  const Wind({required this.speed, required this.degree});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: (json['speed'] ?? 0).toDouble(),
      degree: (json['deg'] ?? 0).toInt(),
    );
  }
}
