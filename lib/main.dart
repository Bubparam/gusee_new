import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guess The Number',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Guess The Number')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.pink.shade50,
              //border: Border.all(width: 10.0, color: Colors.black38),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: Offset(2.0, 5.0),
                  blurRadius: 5.0,
                  spreadRadius: 2.0,
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Guess The Number ',
                        style:
                            TextStyle(fontSize: 20.0, color: Color(0x80FF0000)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Image.asset('assets/images/guess_logo.png',height: 300, width: 200),
                  TextField(),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextButton(
                    child: Text('Guess'),
                    style: TextButton.styleFrom(primary: Colors.white, backgroundColor: Colors.pink),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
