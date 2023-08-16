class HomeworkModel1 {
  String? sId;
  String? title;
  String? desc;
  String? className;
  String? teacherName;
  String? subjectName;

  HomeworkModel1(
      {this.sId,
      this.title,
      this.desc,
      this.className,
      this.teacherName,
      this.subjectName});

  HomeworkModel1.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    desc = json['desc'];
    className = json['className'];
    teacherName = json['teacherName'];
    subjectName = json['subjectName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['className'] = this.className;
    data['teacherName'] = this.teacherName;
    data['subjectName'] = this.subjectName;
    return data;
  }
}