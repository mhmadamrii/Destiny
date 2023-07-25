import 'package:cek/data/dio.dart';
import 'package:cek/functions/utils.dart';

Future<Map<String, dynamic>> getInternalData() async {
  return {};
}

Future<Map<String, dynamic>> getExternalData() async {
  Map<String, dynamic> map = await getHttp();
  String jsonString = fromMapToString(map: map);
  await saveNewInternalData(externalDataString: jsonString);
  return map;
}

Future<void> saveNewInternalData({ required String externalDataString}) async {
  // shared pref saved data from jsonString

}