class DataForUser {
    String id;
    String name;
    String image;
    String nationalId;
    String gradeId;
    String classId;

    DataForUser({
        required this.id,
        required this.name,
        required this.image,
        required this.nationalId,
        required this.gradeId,
        required this.classId,
    });

    factory DataForUser.fromJson(Map<String, dynamic> json) => DataForUser(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        nationalId: json["nationalId"],
        gradeId: json["gradeId"],
        classId: json["classId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "nationalId": nationalId,
        "gradeId": gradeId,
        "classId": classId,
    };
}