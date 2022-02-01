import 'package:flutter/material.dart';
import 'package:guess_number/game.dart';


class LoginPage extends StatefulWidget {
  static const buttonSize = 60.0;

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  var game = Game(maxRandom: 100);
  String _input = '';
  String _input2 = "ทายเลข 1 ถึง 100";

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
                            height: 200, width: 100),
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(_input, style: TextStyle(fontSize: 20.0)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(_input2, style: TextStyle(fontSize: 15.0)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 1; i <= 3; i++) buildButton(i),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 4; i <= 6; i++) buildButton(i),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 7; i <= 9; i++) buildButton(i),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                          onTap: () {
                            print("Delete");
                            setState(() {
                              _input = " ";
                            });
                          },
                          borderRadius:
                              BorderRadius.circular(LoginPage.buttonSize / 2),
                          child: Container(
                            alignment: Alignment.center,
                            width: LoginPage.buttonSize,
                            height: LoginPage.buttonSize,
                            child: Icon(Icons.close),
                          ),
                        ),
                      ),
                      buildButton(0),
                      buildButton(-1),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextButton(
                      child: Text('Guess'),
                      style: TextButton.styleFrom(
                          primary: Colors.white, backgroundColor: Colors.pink),
                      onPressed: () {
                        var guess = int.tryParse(_input!);
                        if (guess == null) {
                          setState(() {
                            _input = " ";
                          });
                          _input2 = 'กรอกข้อมูลไม่ถูกต้อง กรุณากรอกใหม่';
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(_input2, style: TextStyle(fontSize: 10.0)),
                          );
                        }
                        var result = game.doGuess(guess!);
                        if (result == 1) {
                          setState(() {
                            _input = " ";
                          });
                          _input2 = '$guess มากเกินไป กรุณาลองใหม่';
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(_input2, style: TextStyle(fontSize: 10.0)),
                          );
                        } else if (result == -1) {
                          setState(() {
                            _input = " ";
                          });
                          _input2 = '$guess น้อยเกินไป กรุณาลองใหม่';
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(_input2, style: TextStyle(fontSize: 10.0)),
                          );
                        } else {
                          setState(() {
                            _input = " ";
                          });
                          _input2 = '$guess ถูกต้องครับ คุณทายทั้งหมด ${game.count} ครั้ง';
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(_input2, style: TextStyle(fontSize: 10.0)),
                          );
                        }
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      print('Forgot password');
                    },
                    child: Text('ลืมรหัสผ่าน'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButton(int num) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          if (num == -1) {
            print('Backspace');

            setState(() {
              var length = _input.length;
              _input = _input.substring(0, length - 1);
            });
          } else {
            if (_input.length < 4) {
              print('$num');

              setState(() {
                _input = '$_input$num';
              });
            }
          }
        },
        borderRadius: BorderRadius.circular(LoginPage.buttonSize / 2),
        child: Container(
          decoration: (num == -1)
              ? null
              : BoxDecoration(
                  color: Colors.pinkAccent,
                  shape: BoxShape.circle,
                ),
          alignment: Alignment.center,
          width: LoginPage.buttonSize,
          height: LoginPage.buttonSize,
          child: (num == -1)
              ? Icon(Icons.backspace)
              : Text(
                  '$num',
                  style: TextStyle(color: Color(0xffffffff)),
                ),
        ),
      ),
    );
  }
}
