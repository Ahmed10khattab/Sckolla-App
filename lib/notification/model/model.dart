 
class ModelForNotif {
    ScanLocation scanLocation;
    String id;
    String notificationType;
    String message;
    String locationName;
    SecurityId securityId;
    DateTime createdAt;
   // String createdAt;

    ModelForNotif({
        required this.scanLocation,
        required this.id,
        required this.notificationType,
        required this.message,
        required this.locationName,
        required this.securityId,
        required this.createdAt,
       // required this.createdAt,
    });

    factory ModelForNotif.fromJson(Map<String, dynamic> json) => ModelForNotif(
        scanLocation: ScanLocation.fromJson(json["scanLocation"]),
        id: json["_id"],
        notificationType: json["notificationType"],
        message: json["message"],
        locationName: json["locationName"],
        securityId: SecurityId.fromJson(json["securityId"]),
       createdAt: DateTime.parse(json["createdAt"]),
               // createdAt: json["createdAt"],

    );

    Map<String, dynamic> toJson() => {
        "scanLocation": scanLocation.toJson(),
        "_id": id,
        "notificationType": notificationType,
        "message": message,
        "locationName": locationName,
        "securityId": securityId.toJson(),
        "createdAt": createdAt.toIso8601String(),
    };
}

class ScanLocation {
    String lat;
    String lang;

    ScanLocation({
        required this.lat,
        required this.lang,
    });

    factory ScanLocation.fromJson(Map<String, dynamic> json) => ScanLocation(
        lat: json["lat"],
        lang: json["lang"],
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lang": lang,
    };
}

class SecurityId {
    String id;
    String name;

    SecurityId({
        required this.id,
        required this.name,
    });

    factory SecurityId.fromJson(Map<String, dynamic> json) => SecurityId(
        id: json["_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
    };
}
