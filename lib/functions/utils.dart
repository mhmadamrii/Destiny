import 'dart:convert';

import 'package:cek/constants.dart';
import 'package:cek/models/data_model.dart';

Map<String, dynamic> fromStringToMap({required String value}) {
  Map<String, dynamic> map = json.decode(value);
  return map;
}

String fromMapToString({required Map<String, dynamic> map}) {
  String jsonString = json.encode(map);
  return jsonString;
}

DataModel fromMapToDataModel({required Map<String, dynamic> map}) {
  return DataModel(
    activity: map[kActivity],
    type: map['type'],
    participants: map['participants'],
    price: map['price'],
    link: map['link'],
    key: map['key'],
    accessibility: map['acccesbility'],
  );
}
