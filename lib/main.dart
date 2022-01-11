import 'package:flutter/material.dart';
import 'package:guess_number/game.dart';

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
  HomePage({Key? key}) : super(key: key);
  var game = Game(maxRandom: 100);
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Guess The Number')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(color: Colors.pink.shade50,
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
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/guess_logo.png',
                            height: 300, width: 200),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Guess',
                              style: TextStyle(
                                  fontSize: 50.0, color: Color(0x80FF0000)),
                            ),
                            Text(
                              'The Number',
                              style: TextStyle(
                                  fontSize: 25.0, color: Color(0x80FF0000)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _controller,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.7),
                        border: OutlineInputBorder(),
                        hintText: 'ทายเลขตั้งแต่ 1 ถึง 100',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      child: Text('Guess'),
                      style: TextButton.styleFrom(
                          primary: Colors.white, backgroundColor: Colors.pink),
                      onPressed: () {
                        var input = _controller.text;
                        var guess = int.tryParse(input!);
                        if (guess == null) {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Error'),
                                  content: Text(
                                      'กรอกข้อมูลไม่ถูกต้อง กรุณากรอกใหม่'),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    )
                                  ],
                                );
                              });
                        }
                        var result = game.doGuess(guess!);
                        if (result == 1) {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Result'),
                                  content:
                                      Text('$guess มากเกินไป กรุณาลองใหม่'),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    )
                                  ],
                                );
                              });
                        }else if(result == -1){
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Result'),
                                  content:
                                  Text('$guess น้อยเกินไป กรุณาลองใหม่'),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    )
                                  ],
                                );
                              });
                        }else{
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Result'),
                                  content:
                                  Text('$guess ถูกต้องครับ คุณทายทั้งหมด ${game.count} ครั้ง'),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    )
                                  ],
                                );
                              });
                        }
                      },
                    ),
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
