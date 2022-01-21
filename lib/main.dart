import 'package:flutter/material.dart';

void main() {
  runApp(_StatelessCounter());
}

class _StatelessCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Counter'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Tap "+" to increment'),
              _StatefullButton(),
              const Text('Tap "-" to decrement'),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatefullButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ButtonState();
  }
}

class _ButtonState extends State<_StatefullButton> {
  late int _startingValue;

  @override
  void initState() {
    _startingValue = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.blueAccent,
        ),
        width: 120,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  if (_startingValue - 1 > -100) _startingValue -= 1;
                });
              },
              icon: const Icon(Icons.remove),
              color: Colors.white,
            ),
            Text(
              '$_startingValue',
              style: const TextStyle(color: Colors.white),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  if (_startingValue + 1 < 100) _startingValue += 1;
                });
              },
              icon: const Icon(Icons.add_rounded),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
