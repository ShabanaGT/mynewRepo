import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('GridView')),
        body: GridView.count(
          crossAxisCount: 2,
          children: [
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.network('https://picsum.photos/200?image=25',
                      height: 150, width: 150),
                  const Text('Product 1'),
                  const Text('Price: \$100'),
                ],
              ),
            ),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.network('https://picsum.photos/200?image=25',
                      height: 150, width: 150),
                  const Text('Product 2'),
                  const Text('Price: \$150'),
                ],
              ),
            ),
            // Add more product cards as needed
          ],
        ),
      ),
    );
  }
}
