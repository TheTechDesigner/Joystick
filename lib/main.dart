import 'package:flutter/material.dart';
import 'package:joystick/joystick.dart';
import 'package:joystick_example/images.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFC41A3B),
        primaryColorLight: Color(0xFFFBE0E6),
        accentColor: Color(0xFF1B1F32),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = 'JoyStick Example';
  int _selectedImage = 0;
  int _selected = 0;
  List<List<String>> _imageList = [
    [
      captainAmerica,
      captainMarvel,
      ironMan,
      nickFury,
      deadPool,
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              _imageList[_selectedImage][_selected],
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Joystick(
          size: 125.0,
          isDraggable: true,
          iconColor: Color(0xFFC41A3B),
          backgroundColor: Color(0xFFFBE0E6),
          opacity: 0.5,
          joystickMode: JoystickModes.all,
          onLeftPressed: () {
            if(_selected - 1 >= 0) {
              setState(() {
                _selected -= 1;
              });
            }
          },
          onRightPressed: () {
            if(_selected + 1 < _imageList[_selectedImage].length) {
              setState(() {
                _selected += 1;
              });
            }
          },
          onUpPressed: () {
            if(_selected + 1 < _imageList[_selectedImage].length) {
              setState(() {
                _selected += 1;
              });
            }
          },
          onDownPressed: () {
            if(_selected - 1 >= 0) {
              setState(() {
                _selected -= 1;
              });
            }
          },
          onPressed: (_direction) {
            print('pressed $_direction');
          },
        ),
      ),
    );
  }
}
