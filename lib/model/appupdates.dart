class AppUpdates {
    final App app;
    final List<Ad> ads;

    AppUpdates({
        required this.app,
        required this.ads,
    });

    factory AppUpdates.fromJson(Map<String, dynamic> json) => AppUpdates(
        app: App.fromJson(json["app"]),
        ads: List<Ad>.from(json["ads"].map((x) => Ad.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "app": app.toJson(),
        "ads": List<dynamic>.from(ads.map((x) => x.toJson())),
    };
}

class Ad {
    String id;
    String name;
    String type;
    String unit;
    String appsId;

    Ad({
        required this.id,
        required this.name,
        required this.type,
        required this.unit,
        required this.appsId,
    });

    factory Ad.fromJson(Map<String, dynamic> json) => Ad(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        unit: json["unit"],
        appsId: json["apps_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "unit": unit,
        "apps_id": appsId,
    };
}

class App {
    final String id;
    final String name;
    final String package;
    final String status;
    final String version;
    final String devId;

    App({
        required this.id,
        required this.name,
        required this.package,
        required this.status,
        required this.version,
        required this.devId,
    });

    factory App.fromJson(Map<String, dynamic> json) => App(
        id: json["id"],
        name: json["name"],
        package: json["package"],
        status: json["status"],
        version: json["version"],
        devId: json["dev_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "package": package,
        "status": status,
        "version": version,
        "dev_id": devId,
    };
}