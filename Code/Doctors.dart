import 'package:flutter/material.dart';

void main() {
  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget {
  final ValueNotifier<bool> _dark = ValueNotifier<bool>(true);
  final ValueNotifier<double> _widthFactor = ValueNotifier<double>(1.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ValueListenableBuilder<bool>(
        valueListenable: _dark,
        builder: (context, color, child) {
          return ValueListenableBuilder<double>(
            valueListenable: _widthFactor,
            builder: (context, factor, child) {
              return Scaffold(
                backgroundColor: _dark.value ? Colors.black : Colors.white,
                appBar: AppBar(
                  actions: [
                    Switch(
                      value: _dark.value,
                      onChanged: (value) {
                        _dark.value = value;
                      },
                    ),
                    DropdownButton<double>(
                      value: _widthFactor.value,
                      onChanged: (value) {
                        _widthFactor.value = value!;
                      },
                      items: [
                        DropdownMenuItem<double>(
                          value: 0.5,
                          child: Text('Size: 50%'),
                        ),
                        DropdownMenuItem<double>(
                          value: 0.75,
                          child: Text('Size: 75%'),
                        ),
                        DropdownMenuItem<double>(
                          value: 1.0,
                          child: Text('Size: 100%'),
                        ),
                      ],
                    ),
                  ],
                ),
                body: Center(
                  child: Container(
                    width:
                        MediaQuery.of(context).size.width * _widthFactor.value,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Iphone1415ProMaxDoctors()],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Iphone1415ProMaxDoctors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 430,
          height: 932,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: -22,
                child: Container(
                  width: 128,
                  height: 128,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/128/128"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: -17,
                top: 860,
                child: Container(
                  width: 472,
                  height: 100,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 472,
                          height: 100,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0xFFDDDDDD),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 358,
                        top: 10,
                        child: Container(
                          width: 49,
                          height: 54,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 10,
                                top: 0,
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://picsum.photos/30/30",
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 30,
                                child: Text(
                                  'Profile',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    height: 0.09,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 264,
                        top: 7,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://picsum.photos/35/35",
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 236,
                        top: 43,
                        child: Text(
                          'Appointment',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 385,
                        top: 0,
                        child: Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://picsum.photos/22/22",
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 150,
                        top: 4,
                        child: Container(
                          width: 62,
                          height: 58,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 10,
                                top: 0,
                                child: Container(
                                  width: 42,
                                  height: 42,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://picsum.photos/42/42",
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 39,
                                child: Text(
                                  'Hospital',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    height: 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 76,
                        top: 7,
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://picsum.photos/36/36",
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 69,
                        top: 43,
                        child: Text(
                          'Result',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 177,
                top: 58,
                child: Text(
                  'Doctors',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Inter',
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 14,
                top: 259,
                child: Container(
                  width: 398,
                  height: 126,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 398,
                          height: 126,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: Color(0xFF706D54),
                              ),
                              borderRadius: BorderRadius.circular(39),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 13,
                        top: 0,
                        child: Container(
                          width: 381,
                          height: 126,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 75,
                                top: 21,
                                child: Text(
                                  'Dr.Sawsan Hawta',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Inter',
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 265,
                                top: 0,
                                child: Container(
                                  width: 57,
                                  height: 57,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://picsum.photos/57/57",
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 75,
                                top: 57,
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://picsum.photos/28/28",
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 109,
                                top: 63,
                                child: Text(
                                  'Dentistry',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 265,
                                top: 43,
                                child: Container(
                                  width: 83,
                                  height: 83,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://picsum.photos/83/83",
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 15,
                                child: Container(
                                  width: 64,
                                  height: 63,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF0D5EA6),
                                    shape: OvalBorder(),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 7,
                                top: 11,
                                child: Container(
                                  width: 50.64,
                                  height: 63.28,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://picsum.photos/51/63",
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 256,
                                top: 98,
                                child: Text(
                                  'Rated by (213)user',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFFC4E1E6),
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 365,
                                top: 78,
                                child: Text(
                                  '4',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 362,
                                top: 49,
                                child: Transform(
                                  transform:
                                      Matrix4.identity()
                                        ..translate(0.0, 0.0)
                                        ..rotateZ(-1.57),
                                  child: Container(
                                    width: 19,
                                    height: 19,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          "https://picsum.photos/19/19",
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 14,
                top: 396,
                child: Container(
                  width: 398,
                  height: 126,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 398,
                          height: 126,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: Color(0xFF706D54),
                              ),
                              borderRadius: BorderRadius.circular(39),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 9,
                        top: 9,
                        child: Container(
                          width: 385,
                          height: 117,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 79,
                                top: 7,
                                child: Text(
                                  'Dr.Hiwa Amanj',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Inter',
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 79,
                                top: 48,
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://picsum.photos/28/28",
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 113,
                                top: 54,
                                child: Text(
                                  'Dentistry',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 269,
                                top: 34,
                                child: Container(
                                  width: 83,
                                  height: 83,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://picsum.photos/83/83",
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 64,
                                  height: 66,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 3,
                                        child: Container(
                                          width: 64,
                                          height: 63,
                                          decoration: ShapeDecoration(
                                            color: Color(0xFF0D5EA6),
                                            shape: OvalBorder(),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 7,
                                        top: 0,
                                        child: Container(
                                          width: 50.64,
                                          height: 63.29,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                "https://picsum.photos/51/63",
                                              ),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 259,
                                top: 90,
                                child: Text(
                                  'Rated by (457)user',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFFC4E1E6),
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 369,
                                top: 69,
                                child: Text(
                                  '3',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 366,
                                top: 40,
                                child: Transform(
                                  transform:
                                      Matrix4.identity()
                                        ..translate(0.0, 0.0)
                                        ..rotateZ(-1.57),
                                  child: Container(
                                    width: 19,
                                    height: 19,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          "https://picsum.photos/19/19",
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 14,
                top: 533,
                child: Container(
                  width: 398,
                  height: 126,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 398,
                          height: 126,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: Color(0xFF706D54),
                              ),
                              borderRadius: BorderRadius.circular(39),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 9,
                        top: 11,
                        child: Container(
                          width: 385,
                          height: 115,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 79,
                                top: 0,
                                child: Text(
                                  'Dr.Rawia Ali',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Inter',
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 79,
                                top: 46,
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://picsum.photos/28/28",
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 113,
                                top: 52,
                                child: Text(
                                  'Dentistry',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 269,
                                top: 32,
                                child: Container(
                                  width: 83,
                                  height: 83,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://picsum.photos/83/83",
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 1,
                                child: Container(
                                  width: 64,
                                  height: 63,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 64,
                                          height: 63,
                                          decoration: ShapeDecoration(
                                            color: Color(0xFF0D5EA6),
                                            shape: OvalBorder(),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 10,
                                        top: 3,
                                        child: Container(
                                          width: 44,
                                          height: 55,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                "https://picsum.photos/44/55",
                                              ),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 266,
                                top: 87,
                                child: Text(
                                  'Rated by (21)user',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFFC4E1E6),
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 369,
                                top: 67,
                                child: Text(
                                  '5',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 366,
                                top: 38,
                                child: Transform(
                                  transform:
                                      Matrix4.identity()
                                        ..translate(0.0, 0.0)
                                        ..rotateZ(-1.57),
                                  child: Container(
                                    width: 19,
                                    height: 19,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          "https://picsum.photos/19/19",
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 90,
                        top: 94,
                        child: Text(
                          'Asia Hospital',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            height: 0.09,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 14,
                top: 670,
                child: Container(
                  width: 398,
                  height: 126,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 398,
                          height: 126,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: Color(0xFF706D54),
                              ),
                              borderRadius: BorderRadius.circular(39),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 9,
                        top: 1,
                        child: Container(
                          width: 385,
                          height: 125,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 79,
                                top: 11,
                                child: Text(
                                  'Dr.Shan Ata',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Inter',
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 79,
                                top: 56,
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://picsum.photos/28/28",
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 113,
                                top: 62,
                                child: Text(
                                  'Dentistry',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 269,
                                top: 42,
                                child: Container(
                                  width: 83,
                                  height: 83,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://picsum.photos/83/83",
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 64,
                                  height: 78,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 11,
                                        child: Container(
                                          width: 64,
                                          height: 63,
                                          decoration: ShapeDecoration(
                                            color: Color(0xFF0D5EA6),
                                            shape: OvalBorder(),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 62,
                                          height: 78,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                "https://picsum.photos/62/78",
                                              ),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 265,
                                top: 97,
                                child: Text(
                                  'Rated by (67)user',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFFC4E1E6),
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 369,
                                top: 77,
                                child: Text(
                                  '4',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 366,
                                top: 48,
                                child: Transform(
                                  transform:
                                      Matrix4.identity()
                                        ..translate(0.0, 0.0)
                                        ..rotateZ(-1.57),
                                  child: Container(
                                    width: 19,
                                    height: 19,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          "https://picsum.photos/19/19",
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 90,
                        top: 94,
                        child: Text(
                          'Shar Hospital',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            height: 0.09,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 27,
                top: 162,
                child: Container(
                  width: 377,
                  height: 42,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF1F0E8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(84),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 27,
                top: 98,
                child: Container(
                  width: 377,
                  height: 48,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 40,
                                height: double.infinity,
                                padding: const EdgeInsets.only(left: 16),
                                decoration: ShapeDecoration(
                                  color: Color(0xFFEFF2F4),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 24,
                                      height: 24,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 0,
                                            top: 0,
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: double.infinity,
                                  padding: const EdgeInsets.only(
                                    top: 8,
                                    left: 77,
                                    right: 16,
                                    bottom: 8,
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFEFF2F4),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Search for Doctors',
                                        style: TextStyle(
                                          color: Color(0xFF607589),
                                          fontSize: 16,
                                          fontFamily: 'Inter',
                                          height: 0.09,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 366,
                top: 174,
                child: Container(
                  width: 23,
                  height: 23,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/23/23"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 381,
                top: 213,
                child: Container(
                  width: 19,
                  height: 19,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/19/19"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 27,
                top: 162,
                child: Container(
                  width: 47,
                  height: 42,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF1F0E8),
                    shape: OvalBorder(
                      side: BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 36,
                top: 169,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/28/28"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 193,
                top: 175,
                child: Text(
                  'Dentistry',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 300,
                top: 215,
                child: Text(
                  'Most Relevant',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 273,
                top: 212,
                child: Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/22/22"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 29,
                top: 213,
                child: Text(
                  'All Results(23)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 104,
                top: 494,
                child: SizedBox(
                  width: 151,
                  height: 13,
                  child: Text(
                    'Smart Health Tower',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      height: 0.09,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 102,
                top: 353,
                child: Text(
                  'Baxshin Hospital',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    height: 0.09,
                  ),
                ),
              ),
              Positioned(
                left: 39,
                top: 623,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/28/28"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
