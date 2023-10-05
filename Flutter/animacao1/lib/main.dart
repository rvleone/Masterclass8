import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => ButtonAnimation();
}

class ButtonAnimation extends State<MainApp> {
  bool isChange = false;
  final duration = const Duration(seconds: 2);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Animações implícitas'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
              top: 55.0, left: 55.0, bottom: 10.0, right: 10.0),
          child: AnimatedAlign(
            duration: duration,
            alignment: isChange ? Alignment.topLeft : Alignment.bottomRight,
            child: AnimatedScale(
              duration: duration,
              scale: isChange ? 2 : 1,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isChange = !isChange;
                  });
                },
                style: ElevatedButton.styleFrom(
                    animationDuration: duration,
                    shape: RoundedRectangleBorder(
                      borderRadius: isChange
                          ? BorderRadius.circular(0)
                          : BorderRadius.circular(100.0),
                    ),
                    minimumSize: const Size(100, 100)),
                child: const Text('Fluterando'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
