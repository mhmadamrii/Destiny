import 'package:cek/models/data_model.dart';
import 'package:flutter/material.dart';

ValueNotifier<DataModel> dataNotifier = ValueNotifier(
  DataModel(
    activity: 'acitvity',
    type: 'type',
    participants: 0,
    price: 'price',
    link: 'link',
    key: 'key',
    accessibility: 'accessibility',
  ),
);

ValueNotifier<bool> isConnectedNotifier = ValueNotifier(false);