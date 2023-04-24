class Weather {
const Weather({
  required this.temp, 
  required this.feelsLike, 
  required this.tempMin, 
  required this.tempMax,
  });

  final num temp;
  final num feelsLike;
  final num tempMin;
  final num tempMax;

factory Weather.fromJson(Map<String, Object?> json) => Weather(
  temp: json['temp'] as num, 
  feelsLike: json['feels_like'] as num, 
  tempMin: json['temp_min'] as num,
  tempMax: json['temp_max'] as num);

  @override
  String toString() => '''
    Current Temp: ${temp.toStringAsFixed(0)}°C
    Feels like: ${feelsLike.toStringAsFixed(0)}°C
    Min temp: ${tempMin.toStringAsFixed(0)}°C
    Max temp: ${tempMax.toStringAsFixed(0)}°''C
 ''';
}