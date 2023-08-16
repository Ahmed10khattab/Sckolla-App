
 
class ModelFotTeacher {
    String id;
    String name;
    String image;
    String phoneNumber;
    String role;

    ModelFotTeacher({
        required this.id,
        required this.name,
        required this.image,
        required this.phoneNumber,
        required this.role,
    });

    factory ModelFotTeacher.fromJson(Map<String, dynamic> json) => ModelFotTeacher(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        phoneNumber: json["phoneNumber"],
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "phoneNumber": phoneNumber,
        "role": role,
    };
}
