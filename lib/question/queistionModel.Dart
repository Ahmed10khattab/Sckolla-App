// class Msg {
//   List<Messages>? messages;
//   int? currentPage;
//   int? totalPages;

//   Msg({this.messages, this.currentPage, this.totalPages});

//   Msg.fromJson(Map<String, dynamic> json) {
//     if (json['messages'] != null) {
//       messages = <Messages>[];
//       json['messages'].forEach((v) {
//         messages!.add(new Messages.fromJson(v));
//       });
//     }
//     currentPage = json['currentPage'];
//     totalPages = json['totalPages'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.messages != null) {
//       data['messages'] = this.messages!.map((v) => v.toJson()).toList();
//     }
//     data['currentPage'] = this.currentPage;
//     data['totalPages'] = this.totalPages;
//     return data;
//   }
// }

// class Messages {
//   String? sId;
//   bool? isAdmin;
//   String? msg;
//   String? createdAt;

//   Messages({this.sId, this.isAdmin, this.msg, this.createdAt});

//   Messages.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     isAdmin = json['isAdmin'];
//     msg = json['msg'];
//     createdAt = json['createdAt'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['isAdmin'] = this.isAdmin;
//     data['msg'] = this.msg;
//     data['createdAt'] = this.createdAt;
//     return data;
//   }
// }