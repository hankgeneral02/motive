import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Opacity Demo';
    return const MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState  extends State<MyHomePage>  {

  static const String _title = 'Flutter Code Sample';
  bool selected = true;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: AnimatedAlign(
          alignment: selected ? Alignment.center : Alignment.topCenter,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          child: const FlutterLogo(size: 50.0),
          onEnd: () {
            setState(() {
              selected = true;
              print('onEnd');
            });
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              selected = false;
              print("on pressed $selected");

            });
          },
          tooltip: 'Toggle Opacity',
          child: const Icon(Icons.flip),
        ),
      ),
    );
  }
}



