class WeatherEntity {
  Location location;
  Current current;
  Forecast forecast;

  WeatherEntity({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory WeatherEntity.fromJson(Map<String, dynamic> json) => WeatherEntity(
    location: Location.fromJson(json["location"]),
    current: Current.fromJson(json["current"]),
    forecast: Forecast.fromJson(json["forecast"]),
  );

}

class Current {
  int lastUpdatedEpoch;
  String lastUpdated;
  double tempC;
  int isDay;
  Condition condition;
  double windMph;
  double windKph;

  Current({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,

  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    lastUpdatedEpoch: json["last_updated_epoch"],
    lastUpdated: json["last_updated"],
    tempC: json["temp_c"]?.toDouble(),
    isDay: json["is_day"],
    condition: Condition.fromJson(json["condition"]),
    windMph: json["wind_mph"]?.toDouble(),
    windKph: json["wind_kph"]?.toDouble(),
  );

}

class Condition {
  String text;
  String icon;

  Condition({
    required this.text,
    required this.icon,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
    text: json["text"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "icon": icon,
  };
}

class Forecast {
  List<Forecastday> forecastday;

  Forecast({
    required this.forecastday,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
    forecastday: List<Forecastday>.from(json["forecastday"].map((x) => Forecastday.fromJson(x))),
  );

}

class Forecastday {
  DateTime date;
  Day day;
  Astro astro;

  Forecastday({
    required this.date,
    required this.day,
    required this.astro,
  });

  factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
    date: DateTime.parse(json["date"]),
    day: Day.fromJson(json["day"]),
    astro: Astro.fromJson(json["astro"]),
  );


}

class Astro {
  String sunrise;
  String sunset;
  String moonrise;
  String moonset;
  String moonPhase;
  int moonIllumination;
  int isMoonUp;
  int isSunUp;

  Astro({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
    required this.isMoonUp,
    required this.isSunUp,
  });

  factory Astro.fromJson(Map<String, dynamic> json) => Astro(
    sunrise: json["sunrise"],
    sunset: json["sunset"],
    moonrise: json["moonrise"],
    moonset: json["moonset"],
    moonPhase: json["moon_phase"],
    moonIllumination: json["moon_illumination"],
    isMoonUp: json["is_moon_up"],
    isSunUp: json["is_sun_up"],
  );

}

class Day {
  double maxtempC;
  double mintempC;
  double avgtempC;
  double maxwindMph;
  double maxwindKph;
  Condition condition;

  Day({
    required this.maxtempC,
    required this.mintempC,
    required this.avgtempC,
    required this.maxwindMph,
    required this.maxwindKph,
    required this.condition,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
    maxtempC: json["maxtemp_c"]?.toDouble(),
    mintempC: json["mintemp_c"]?.toDouble(),
    avgtempC: json["avgtemp_c"]?.toDouble(),
    maxwindMph: json["maxwind_mph"]?.toDouble(),
    maxwindKph: json["maxwind_kph"]?.toDouble(),
    condition: Condition.fromJson(json["condition"]),
  );
}

class Location {
  String name;
  String region;
  String country;
  Location({
    required this.name,
    required this.region,
    required this.country,

  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
    region: json["region"],
    country: json["country"],
  );

}