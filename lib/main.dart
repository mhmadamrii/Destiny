import 'dart:async';

import 'package:cek/data/notifiers/notifiers.dart';
import 'package:cek/screens/homepage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'as-playground/play_home.dart';

void main() => runApp(const MySecondApp()); // default is MyApp()

class MySecondApp extends StatelessWidget {
  const MySecondApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const PlayHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription<ConnectivityResult> subscription;
  @override
  void initState() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        isConnectedNotifier.value = false;
      } else {
        isConnectedNotifier.value = true;
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
    );
  }
}
