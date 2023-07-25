import 'package:cek/data/notifiers/notifiers.dart';
import 'package:cek/functions/manage_data.dart';
import 'package:cek/functions/utils.dart';

Map<String, dynamic> dataMapCurrent = {};

Future<void> setDataNotifier() async {
  if (isConnectedNotifier.value) {
    dataMapCurrent = await getExternalData();
  } else {
    dataMapCurrent = await getInternalData();
  }

  if (dataMapCurrent.isNotEmpty) {
    dataNotifier.value = fromMapToDataModel(map: dataMapCurrent);
  }
}
