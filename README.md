# flutter_application_26

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Responsive dan Adaptive

untuk mekukan perubahan pada posisi potrait dan landscape pada fungsi main harus menambahkan aturan sebagai berikut

```dart
void main(){
	WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);
}
```

- media query
    
    media query adalah sebuah widget yang sering digunakan untuk mendapatkan ukuran atau size dari sebuah device. media query juga digunakan untuk mendapatkan status mode orientasi device potret atau landscape. 
    
    hal yang harus di perhatikan saat menggunakan media query :
    
    - tinggi dari padding area top dari aplikasi
    - tinggi dari sebuah appBar
    - biasakan membuat final const untuk mengambil sebuah nilai dari media query
    - tinggi media query dihitung dari keseluruhan sebuah layar tampilan
    - sisi yang bisa digunakan yaitu tinggi dan lebar.

```dart
final mediaQueryHeight = MediaQuery.of(context).size.height;
final mediaQueryWidth = MediaQuery.of(context).size.width;
final myAppBar = AppBar(
	title: const Text('Media Query'),
);

final bodyHeigth = mediaQueryHeight - myAppBar.preferredSize.height - MediaQuery.of(context).padding.top;
```

kondisional rendering bisa menggunakan pengecekan orientasi sebuah layar

```dart
final bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
```

konditional rendering lebih baik dipisahkan agar tidak terjadinya penumpukan code pada saat melakukan pengecekan orientasi dan rendering sebuah tampilan.

```dart
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return isLandscape ? const Landscape() : const Portrait();
  }
}
```


```dart
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

```

foto 1