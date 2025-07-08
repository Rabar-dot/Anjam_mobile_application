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
                      children: [Iphone1415ProMaxHomePage()],
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

class Iphone1415ProMaxHomePage extends StatelessWidget {
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
                left: -4,
                top: -17,
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
                left: 14,
                top: 640,
                child: Container(
                  width: 399,
                  height: 237,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 398,
                          height: 237,
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
                        left: 8,
                        top: 113,
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
                        left: 89,
                        top: 23,
                        child: SizedBox(
                          width: 182,
                          height: 24,
                          child: Text(
                            'Dr.Nasren Amanj',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 51,
                        top: 126,
                        child: SizedBox(
                          width: 97,
                          height: 18,
                          child: Text(
                            '23 jul, 2025',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Inter',
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 322,
                        top: 117,
                        child: Transform(
                          transform:
                              Matrix4.identity()
                                ..translate(0.0, 0.0)
                                ..rotateZ(3.14),
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
                      ),
                      Positioned(
                        left: 330,
                        top: 126,
                        child: SizedBox(
                          width: 59,
                          height: 18,
                          child: Text(
                            'Contact',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Inter',
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 22,
                        top: 194,
                        child: Container(
                          width: 123,
                          height: 35,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(90.50),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 57,
                        top: 203,
                        child: SizedBox(
                          width: 52,
                          height: 18,
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Inter',
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 161,
                        top: 193,
                        child: Container(
                          width: 214,
                          height: 35,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF1F0E8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(117.50),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 223,
                        top: 203,
                        child: SizedBox(
                          width: 87,
                          height: 18,
                          child: Text(
                            'Reschedule',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Inter',
                              height: 0.08,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 399,
                        top: 28,
                        child: Transform(
                          transform:
                              Matrix4.identity()
                                ..translate(0.0, 0.0)
                                ..rotateZ(1.57),
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
                      ),
                      Positioned(
                        left: 156,
                        top: 118,
                        child: Container(
                          width: 33,
                          height: 33,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://picsum.photos/33/33",
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 197,
                        top: 126,
                        child: SizedBox(
                          width: 71,
                          height: 18,
                          child: Text(
                            '10:30 AM',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Inter',
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 13,
                        top: 18,
                        child: Container(
                          width: 78,
                          height: 78,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://picsum.photos/78/78",
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 97,
                        top: 59,
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
                        left: 129,
                        top: 63,
                        child: Text(
                          'Ophthalmology',
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
                        left: 368,
                        top: 10,
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
                        left: 358,
                        top: 40,
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
                left: 101,
                top: 64,
                child: Text(
                  'Welcome, Amanj shorsh',
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
                top: 289,
                child: Text(
                  'Today’s Appointment',
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
                top: 594,
                child: Text(
                  'Tomorrow Appointment',
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
                top: 170,
                child: Container(
                  width: 410,
                  height: 97,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 73,
                          height: 73,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF1F0E8),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 321,
                        top: 0,
                        child: Container(
                          width: 73,
                          height: 73,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF1F0E8),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 16,
                        top: 18,
                        child: Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://picsum.photos/38/38",
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 107,
                        top: 0,
                        child: Container(
                          width: 73,
                          height: 73,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 73,
                                  height: 73,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFF1F0E8),
                                    shape: OvalBorder(),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 16,
                                top: 17,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://picsum.photos/40/40",
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
                        left: 214,
                        top: 0,
                        child: Container(
                          width: 73,
                          height: 73,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 73,
                                  height: 73,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFF1F0E8),
                                    shape: OvalBorder(),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 12,
                                top: 7,
                                child: Container(
                                  width: 49,
                                  height: 49,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://picsum.photos/49/49",
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
                        left: 334,
                        top: 13,
                        child: Container(
                          width: 47,
                          height: 47,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://picsum.photos/47/47",
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 12,
                        top: 73,
                        child: Text(
                          'Doctor',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            height: 0.09,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 108,
                        top: 73,
                        child: Text(
                          'Medicine',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            height: 0.09,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 211,
                        top: 73,
                        child: Text(
                          'Emergency',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            height: 0.09,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 314,
                        top: 73,
                        child: SizedBox(
                          width: 96,
                          height: 15,
                          child: Text(
                            'Health care',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              height: 0.09,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 7,
                top: 124,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Text(
                        'Quick Actions',
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
                      left: 336,
                      top: 0,
                      child: Text(
                        'Show all',
                        style: TextStyle(
                          color: Color(0xFFDDDDDD),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          height: 0.09,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 14,
                top: 335,
                child: Container(
                  width: 398,
                  height: 237,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 398,
                          height: 237,
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
                        left: 375,
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
                      Positioned(
                        left: 8,
                        top: 113,
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
                        left: 8,
                        top: 0,
                        child: Container(
                          width: 76.83,
                          height: 96,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://picsum.photos/77/96",
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 87,
                        top: 21,
                        child: Text(
                          'Dr.Ahmad Hussain',
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
                        left: 51,
                        top: 126,
                        child: SizedBox(
                          width: 97,
                          height: 18,
                          child: Text(
                            '22 jul, 2025',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Inter',
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 322,
                        top: 117,
                        child: Transform(
                          transform:
                              Matrix4.identity()
                                ..translate(0.0, 0.0)
                                ..rotateZ(3.14),
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
                      ),
                      Positioned(
                        left: 330,
                        top: 126,
                        child: Text(
                          'Contact',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Inter',
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 22,
                        top: 194,
                        child: Container(
                          width: 123,
                          height: 35,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(90.50),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 57,
                        top: 203,
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Inter',
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 161,
                        top: 193,
                        child: Container(
                          width: 214,
                          height: 35,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF1F0E8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(117.50),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 223,
                        top: 203,
                        child: Text(
                          'Reschedule',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Inter',
                            height: 0.08,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 287,
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
                        left: 156,
                        top: 118,
                        child: Container(
                          width: 33,
                          height: 33,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://picsum.photos/33/33",
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 197,
                        top: 126,
                        child: Text(
                          '10:30 AM',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Inter',
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 93,
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
                        left: 121,
                        top: 61,
                        child: Text(
                          'Cardiology',
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
                left: 185,
                top: 510,
                child: Container(
                  width: 245,
                  height: 350,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFDDDDDD),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 196,
                top: 663,
                child: Container(
                  width: 58,
                  height: 58,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF1F0E8),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 257,
                top: 680,
                child: Text(
                  'Nearest Hospital',
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
                left: 199,
                top: 795,
                child: Container(
                  width: 58,
                  height: 58,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF1F0E8),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 194,
                top: 600,
                child: Container(
                  width: 58,
                  height: 58,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 58,
                          height: 58,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF1F0E8),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 11,
                        top: 10,
                        child: Container(
                          width: 39,
                          height: 39,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://picsum.photos/39/39",
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
                left: 230,
                top: 604,
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
                left: 195,
                top: 515,
                child: Container(
                  width: 226,
                  height: 74,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF1F0E8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(117.50),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 208,
                top: 529,
                child: Container(
                  width: 39,
                  height: 39,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/39/39"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 267,
                top: 537,
                child: Text(
                  'Sophia Carter',
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
                top: 618,
                child: Text(
                  'My health care',
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
                left: 205,
                top: 672,
                child: Container(
                  width: 39,
                  height: 39,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/39/39"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 208,
                top: 804,
                child: Container(
                  width: 39,
                  height: 39,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/39/39"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 199,
                top: 729,
                child: Container(
                  width: 58,
                  height: 58,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 58,
                          height: 58,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF1F0E8),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 9,
                        top: 9,
                        child: Container(
                          width: 39,
                          height: 39,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://picsum.photos/39/39",
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
                left: 297,
                top: 746,
                child: Text(
                  'Records',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Inter',
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 300,
                top: 812,
                child: Text(
                  'Setting',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Inter',
                    height: 0,
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
