import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return isLandscape ? const Landscape() : const Portrait();
  }
}

class Portrait extends StatelessWidget {
  const Portrait({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final myAppBar = AppBar(
      title: const Text('Media Query'),
    );

    final bodyHeigth = mediaQueryHeight -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: myAppBar,
      body: Center(
        child: Column(
          children: [
            Container(
              height: bodyHeigth * 0.3,
              width: mediaQueryWidth,
              color: Colors.amber,
            ),
            Container(
              height: bodyHeigth * 0.7,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(),
                    title: Text('Item $index'),
                    subtitle: Text('Subtitle $index'),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Landscape extends StatelessWidget {
  const Landscape({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final myAppBar = AppBar(
      title: const Text('Media Query'),
    );

    final bodyHeigth = mediaQueryHeight -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: myAppBar,
      body: Center(
        child: Column(
          children: [
            Container(
              height: bodyHeigth * 0.5,
              width: mediaQueryWidth,
              color: Colors.amber,
            ),
            Container(
              height: bodyHeigth * 0.5,
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return GridTile(
                    child: Container(
                      color: Color.fromARGB(
                        255,
                        Random().nextInt(256),
                        Random().nextInt(256),
                        Random().nextInt(256),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
