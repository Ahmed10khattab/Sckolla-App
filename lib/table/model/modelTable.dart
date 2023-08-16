 
// class ModelForTable {
//     String id;
//     int day;
//     String startAt;
//     String endAt;
//     String subject;
//     String teacher;

//     ModelForTable({
//         required this.id,
//         required this.day,
//         required this.startAt,
//         required this.endAt,
//         required this.subject,
//         required this.teacher,
//     });

//     factory ModelForTable.fromJson(Map<String, dynamic> json) => ModelForTable(
//         id: json["_id"],
//         day: json["day"],
//         startAt: json["startAt"],
//         endAt:json["endAt"],
//         subject: json["subject"],
//         teacher: json["teacher"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "day": day,
//         "startAt": startAt,
//         "endAt": endAt,
//         "subject": subject,
//         "teacher": teacher,
//     };
// }



class ModelForTable {
  String? sId;
  int? day;
  String? subject;
  String? teacher;
  String? time;

  ModelForTable({this.sId, this.day, this.subject, this.teacher, this.time});

  ModelForTable.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    day = json['day'];
    subject = json['subject'];
    teacher = json['teacher'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['day'] = this.day;
    data['subject'] = this.subject;
    data['teacher'] = this.teacher;
    data['time'] = this.time;
    return data;
  }
} 


