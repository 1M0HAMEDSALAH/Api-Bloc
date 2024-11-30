class Location {
    final Street street;
    final String city;
    final String state;
    final String country;
    final int postcode;
    final Coordinates coordinates;
    final Timezone timezone;

    Location({
        required this.street,
        required this.city,
        required this.state,
        required this.country,
        required this.postcode,
        required this.coordinates,
        required this.timezone,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        street: Street.fromJson(json["street"]),
        city: json["city"],
        state: json["state"],
        country: json["country"],
        postcode: json["postcode"],
        coordinates: Coordinates.fromJson(json["coordinates"]),
        timezone: Timezone.fromJson(json["timezone"]),
    );

    Map<String, dynamic> toJson() => {
        "street": street.toJson(),
        "city": city,
        "state": state,
        "country": country,
        "postcode": postcode,
        "coordinates": coordinates.toJson(),
        "timezone": timezone.toJson(),
    };
}
//-------------------------------------------
class Coordinates {
    String latitude;
    String longitude;

    Coordinates({
        required this.latitude,
        required this.longitude,
    });

    factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        latitude: json["latitude"],
        longitude: json["longitude"],
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
    };
}
//-------------------------------------------
class Street {
    int number;
    String name;

    Street({
        required this.number,
        required this.name,
    });

    factory Street.fromJson(Map<String, dynamic> json) => Street(
        number: json["number"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
    };
}
//-------------------------------------------
class Timezone {
    String offset;
    String description;

    Timezone({
        required this.offset,
        required this.description,
    });

    factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
        offset: json["offset"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "offset": offset,
        "description": description,
    };
}
