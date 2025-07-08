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
                      backgroundColor:
                          _dark.value ? Colors.black : Colors.white,
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
                        width: MediaQuery.of(context).size.width *
                            _widthFactor.value,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Iphone1415ProMaxDoctors(),
                          ],
                        ),
                      )));
                },
              );
            }));
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
                                      image: NetworkImage("https://picsum.photos/30/30"),
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
                              image: NetworkImage("https://picsum.photos/35/35"),
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
                              image: NetworkImage("https://picsum.photos/22/22"),
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
                                      image: NetworkImage("https://picsum.photos/42/42"),
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
                              image: NetworkImage("https://picsum.photos/36/36"),
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
                left: 130,
                top: 53,
                child: Container(
                  width: 170,
                  height: 152,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 128,
                        child: SizedBox(
                          width: 170,
                          height: 24,
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
                      ),
                      Positioned(
                        left: 32,
                        top: 0,
                        child: Container(
                          width: 106.76,
                          height: 106.76,
                          child: Stack(
                            children: [
                              Positioned(
                                left: -0,
                                top: 4.85,
                                child: Container(
                                  width: 106.76,
                                  height: 101.90,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF0D5EA6),
                                    shape: OvalBorder(),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 12.32,
                                top: -0,
                                child: Container(
                                  width: 83.18,
                                  height: 103.96,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage("https://picsum.photos/83/104"),
                                      fit: BoxFit.fill,
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
                left: 32,
                top: 23,
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
                left: 120,
                top: 211,
                child: SizedBox(
                  width: 198,
                  height: 23,
                  child: Text(
                    'Smart Health Tower',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      height: 0.06,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 131,
                top: 291,
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
                left: 174,
                top: 295,
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
                left: 27,
                top: 330,
                child: Container(
                  width: 384,
                  height: 117,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 384,
                          height: 117,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                              ),
                              borderRadius: BorderRadius.circular(31),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 9,
                        top: 57,
                        child: Container(
                          width: 367,
                          height: 53,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 286,
                                top: 0,
                                child: Container(
                                  width: 81,
                                  height: 53,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF91C8E4),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 301,
                                top: 25,
                                child: Text(
                                  'Available',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF0D5EA6),
                                    fontSize: 11,
                                    fontFamily: 'Inter',
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 297,
                                top: 6,
                                child: SizedBox(
                                  width: 59,
                                  height: 15,
                                  child: Text(
                                    'Thursday',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFF2F2F2),
                                      fontSize: 11,
                                      fontFamily: 'Inter',
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 198,
                                top: 6,
                                child: SizedBox(
                                  width: 66,
                                  height: 15,
                                  child: Text(
                                    'Wednesday',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF91C8E4),
                                      fontSize: 11,
                                      fontFamily: 'Inter',
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 199,
                                top: 25,
                                child: Text(
                                  'Unavailable',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF91C8E4),
                                    fontSize: 11,
                                    fontFamily: 'Inter',
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 81,
                                  height: 53,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF91C8E4),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 17,
                                top: 6,
                                child: SizedBox(
                                  width: 44,
                                  height: 15,
                                  child: Text(
                                    'Monday',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFF2F2F2),
                                      fontSize: 11,
                                      fontFamily: 'Inter',
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 15,
                                top: 25,
                                child: Text(
                                  'Available',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF0D5EA6),
                                    fontSize: 11,
                                    fontFamily: 'Inter',
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 112,
                                top: 6,
                                child: SizedBox(
                                  width: 48,
                                  height: 15,
                                  child: Text(
                                    'Tuesday',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFF2F2F2),
                                      fontSize: 11,
                                      fontFamily: 'Inter',
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 113,
                                top: 25,
                                child: Text(
                                  'Available',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF0D5EA6),
                                    fontSize: 11,
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
                        left: 20,
                        top: 5,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("https://picsum.photos/35/35"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 67,
                        top: 13,
                        child: Text(
                          'Available time',
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
                        left: 271,
                        top: 13,
                        child: Text(
                          'Office Room: 417 \nFloor: 3',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
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
                left: 172,
                top: 239,
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
                left: 206,
                top: 245,
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
                left: 344,
                top: 34,
                child: Text(
                  'Feedback',
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
                left: 201,
                top: 452,
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
                left: 49,
                top: 476,
                child: SizedBox(
                  width: 334,
                  child: Text(
                    'Specialized in the diagnosis and treatment of dental and facial irregularities. Skilled in designing and managing orthodontic treatment plans using braces,\n aligners, and other corrective appliances. Developed deep understanding of jaw growth, bite correction, and esthetic dental solutions.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 571,
                child: Container(
                  width: 372,
                  height: 282,
                  decoration: ShapeDecoration(
                    color: Color(0xFF97B067),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(72),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 214,
                top: 580,
                child: Text(
                  'Info',
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
                left: 186,
                top: 578,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/20/20"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 47,
                top: 603,
                child: SizedBox(
                  width: 340,
                  child: Text(
                    'Dr. Hiwa Amanj is a specialized orthodontist practicing at Smart Health Tower, focusing on the diagnosis and treatment of dental and facial irregularities. He brings extensive expertise in designing comprehensive orthodontic treatment plans using traditional braces, modern clear aligners, and various corrective appliances. Dr. Amanj has developed a deep understanding of jaw growth patterns and bite correction, enabling him to provide effective treatments for complex orthodontic cases. His practice emphasizes both functional improvement and esthetic dental solutions, combining technical precision with patient comfort throughout the treatment process. Through his dedicated focus on orthodontics at Smart Health Tower's modern facilities, he has helped numerous patients achieve improved dental function and enhanced smile aesthetics.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      height: 0,
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