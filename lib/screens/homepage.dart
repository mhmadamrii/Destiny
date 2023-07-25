import 'package:cek/data/notifiers/notifiers.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Icon(Icons.home),
            ValueListenableBuilder(
              valueListenable: dataNotifier,
              builder: (context, data, child) {
                return Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Text(data.activity)
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
