import 'package:cloud_firestore/cloud_firestore.dart';

class CRUD {
  String Name;
  String Type;
  String Date;
  String Time;
  String? id;
  CRUD(
      {required this.Name,
      required this.Type,
      required this.Date,
      required this.Time,
      this.id});

  factory CRUD.fromQuery(QueryDocumentSnapshot json) {
    return CRUD(
        id: json.id,
        Name: json["Name"] ?? "",
        Type: json["Type"] ?? "",
        Date: json["Date"] ?? "",
        Time: json["Time"] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {
      "Name": Name,
      "Type": Type,
      "Date": Date,
      "Time": Time,
    };
  }
}
