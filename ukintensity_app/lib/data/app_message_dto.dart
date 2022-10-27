import 'dart:convert';

class AppMessage {
  String? id;
  String? heading;
  String? text;

  AppMessage({required this.id, required this.heading, required this.text});

  AppMessage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    heading = json['heading'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['heading'] = this.heading;
    data['text'] = this.text;
    return data;
  }
}

List<AppMessage> AppMessageFromJson(String str) => List<AppMessage>.from(json.decode(str).map((x) => AppMessage.fromJson(x)));
String AppMessageToJson(List<AppMessage> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));