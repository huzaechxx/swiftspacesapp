import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:projectry/ModelClass.dart';
import 'package:projectry/home.dart';
import 'package:projectry/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class booking extends StatefulWidget {
  @override
  State<booking> createState() => _bookingState();
}

class _bookingState extends State<booking> {
  DateTime dateTime = DateTime.now();
  DateTime dateTime2 = DateTime.now();
  String dropdownvalue = 'Tokyo,Japan';
  int adults = 0;
  int children1 = 0;

  void _showdatepicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  background: Colors.white,
                ),
                textTheme: const TextTheme(
                    bodyLarge: TextStyle(fontSize: 20, color: Colors.black))),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50.h),
                  child: Container(
                    height: 400.h,
                    width: 350.w,
                    child: child,
                  ),
                )
              ],
            ));
      },
    ).then((value) {
      setState(() {
        dateTime = value!;
      });
    });
  }

  void _showdatepicker2() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  background: Colors.white,
                ),
                textTheme: const TextTheme(
                    bodyLarge: TextStyle(fontSize: 20, color: Colors.black))),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50.h),
                  child: Container(
                    height: 400.h,
                    width: 350.w,
                    child: child,
                  ),
                )
              ],
            ));
      },
    ).then((value) {
      setState(() {
        dateTime2 = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Stack(
            children: [
              Container(
                color: Color.fromARGB(255, 0, 179, 255),
              ),
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/sss.png'),
                        fit: BoxFit.cover)),
                margin: EdgeInsets.only(top: 20.h),
              ),
              Container(
                padding: EdgeInsets.only(top: 0.h),
                // color: Color.fromARGB(200, 255, 255, 255),
                color: Color.fromARGB(135, 255, 255, 255),
                child: Container(
                  margin: EdgeInsets.only(
                      top: 60.h, bottom: 50.h, right: 20.w, left: 20.w),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white),
                      boxShadow: const [
                        BoxShadow(
                            spreadRadius: 8,
                            blurRadius: 8,
                            color: Colors.black12)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.cancel)),
                          SizedBox(
                            width: 70.w,
                          ),
                          Text(
                            'booking',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      GestureDetector(
                        onTap: _showdatepicker,
                        child: Column(
                          children: [
                            Container(
                              width: 190.w,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(),
                              child: Text(
                                'Select Checkin Date',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                                width: 170.w,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1, color: Colors.black),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                          spreadRadius: 4,
                                          blurRadius: 16,
                                          color: Colors.black12)
                                    ]),
                                child: Row(
                                  children: [
                                    Text(
                                      '${dateTime.day},${dateTime.month},${dateTime.year}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: Colors.black,
                                              fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: 50.w,
                                    ),
                                    Icon(Icons.calendar_month)
                                  ],
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      GestureDetector(
                        onTap: _showdatepicker2,
                        child: Column(
                          children: [
                            Container(
                              width: 200.w,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(),
                              child: Text(
                                'Select Checkout Date',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                                width: 170.w,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1, color: Colors.black),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                          spreadRadius: 4,
                                          blurRadius: 16,
                                          color: Colors.black12)
                                    ]),
                                child: Row(
                                  children: [
                                    Text(
                                      '${dateTime2.day},${dateTime2.month},${dateTime2.year}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: Colors.black,
                                              fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: 50.w,
                                    ),
                                    Icon(Icons.calendar_month)
                                  ],
                                )),
                            SizedBox(
                              height: 30.h,
                            ),
                          ],
                        ),
                      ),
                      Material(
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    spreadRadius: 4,
                                    blurRadius: 16,
                                    color: Colors.black12)
                              ]),
                          width: 180.w,
                          child: DropdownButton(
                              iconSize: 30,
                              isExpanded: true,
                              items: const [
                                DropdownMenuItem(
                                    child: Text('Rio de janeiro,Brazil'),
                                    value: 'Rio de janeiro,Brazil'),
                                DropdownMenuItem(
                                    child: Text('Denmark,Germany'),
                                    value: 'Denmark,Germany'),
                                DropdownMenuItem(
                                    child: Text('London,UK'),
                                    value: 'London,UK'),
                                DropdownMenuItem(
                                    child: Text('Paris,France'),
                                    value: 'Paris,France'),
                                DropdownMenuItem(
                                    child: Text('Tokyo,Japan'),
                                    value: 'Tokyo,Japan'),
                                DropdownMenuItem(
                                    child: Text('Newyork,USA'),
                                    value: 'Newyork,USA'),
                                DropdownMenuItem(
                                    child: Text('LA,USA'), value: 'LA,USA'),
                                DropdownMenuItem(
                                    child: Text('Miami,USA'),
                                    value: 'Miami,USA'),
                                DropdownMenuItem(
                                    child: Text('Berlin,Germany'),
                                    value: 'Berlin,Germany'),
                              ],
                              value: dropdownvalue,
                              onChanged: (String? val) {
                                setState(() {
                                  dropdownvalue = val!;
                                });
                              }),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'ADD GUESTS',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 80.w,
                          ),
                          Text(
                            'Adults:',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: 20, color: Colors.black),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(
                            height: 30.h,
                            width: 30.h,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 0, 179, 255),
                                border:
                                    Border.all(width: 1, color: Colors.black),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20))),
                            child: Center(
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      adults--;
                                    });
                                  },
                                  icon: Icon(Icons.remove)),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5.w, right: 5.w),
                            child: Text(
                              '${adults}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontSize: 20, color: Colors.black),
                            ),
                          ),
                          Container(
                            height: 30.h,
                            width: 30.h,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 0, 179, 255),
                                border:
                                    Border.all(width: 1, color: Colors.black),
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            child: Center(
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      adults++;
                                    });
                                  },
                                  icon: Icon(Icons.add)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 60.w,
                          ),
                          Text(
                            'Children:',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: 20, color: Colors.black),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(
                            height: 30.h,
                            width: 30.h,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 0, 179, 255),
                                border:
                                    Border.all(width: 1, color: Colors.black),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20))),
                            child: Center(
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      children1--;
                                    });
                                  },
                                  icon: Icon(Icons.remove)),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5.w, right: 5.w),
                            child: Text(
                              '${children1}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontSize: 20, color: Colors.black),
                            ),
                          ),
                          Container(
                            height: 30.h,
                            width: 30.h,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 0, 179, 255),
                                border:
                                    Border.all(width: 1, color: Colors.black),
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            child: Center(
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      children1++;
                                    });
                                  },
                                  icon: Icon(Icons.add)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => topbar1(
                                        city: dropdownvalue,
                                        adults: adults,
                                        children1: children1,
                                        checkin: dateTime,
                                        checkout: dateTime2)));
                          },
                          child: Container(
                            width: 200.w,
                            height: 40.h,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 0, 179, 255),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Center(
                              child: Text(
                                'Submit',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: (context, child) => Scaffold(
        backgroundColor: Color.fromARGB(255, 123, 215, 255),
        body: Container(
          margin: EdgeInsets.only(top: 30.h),
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 0, 179, 255),
              image: DecorationImage(
                  image: AssetImage('images/sss.png'), fit: BoxFit.cover)),
          child: Stack(
            children: [
              Container(
                color: Color.fromARGB(135, 255, 255, 255),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 100.h, bottom: 100.h, right: 30.w, left: 30.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 8, spreadRadius: 8, color: Colors.black12)
                    ]),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.cancel)),
                        SizedBox(width: 60.w),
                        Text(
                          'Settings',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 30),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Center(
                      child: TextButton(
                        child: Container(
                          width: 200.w,
                          height: 40.h,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 0, 179, 255),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    spreadRadius: 4,
                                    blurRadius: 12)
                              ]),
                          child: Center(
                            child: Text(
                              'Logout',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const mainscreen()));
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable, camel_case_types
class receipt extends StatelessWidget {
  receipt(
      {Key? key,
      required this.value,
      required this.adults,
      required this.children1,
      required this.checkin,
      required this.checkout})
      : super(key: key);

  String value;
  int children1, adults;
  DateTime checkin, checkout;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme:
              ColorScheme.light(primary: Color.fromARGB(255, 0, 179, 255))),
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: Color.fromARGB(255, 0, 179, 255),
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: 550.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                              spreadRadius: 8,
                              blurRadius: 8,
                              color: Colors.black12)
                        ]),
                    margin: EdgeInsets.only(top: 30.h, right: 20.w, left: 20.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Booking ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Colors.black,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                            ),
                            IconButton.filled(
                                color: Colors.white,
                                iconSize: 28,
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.done_rounded,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.w, right: 20.w),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 8,
                                    blurRadius: 8,
                                    color: Colors.black12)
                              ]),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Text(
                                    'Guests:',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Text(
                                    'Adults: ${adults}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                  ),
                                  Text(
                                    '    Children: ${children1}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Text(
                                    'City: ${value}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Text(
                                    'Checkin: ${checkin.day},${checkin.month},${checkin.year}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Text(
                                    'Checkout: ${checkout.day},${checkout.month},${checkout.year}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Text(
                                    'Days Stayed: ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                  ),
                                  Text(
                                    '${checkout.day - checkin.day}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => topbar()));
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 50.w, right: 50.w),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 0, 179, 255),
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 8,
                                        blurRadius: 8,
                                        color: Colors.black12)
                                  ]),
                              child: Text(
                                'Done',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: Colors.white, fontSize: 20),
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable, camel_case_types
class topbar1 extends StatefulWidget {
  topbar1(
      {super.key,
      required this.city,
      required this.adults,
      required this.children1,
      required this.checkin,
      required this.checkout});
  final String city;
  int children1, adults;
  DateTime checkin, checkout;

  @override
  State<topbar1> createState() => _topbarState(
      city: city,
      adults: adults,
      children1: children1,
      checkin: checkin,
      checkout: checkout);
}

class _topbarState extends State<topbar1> {
  _topbarState(
      {required this.city,
      required this.adults,
      required this.children1,
      required this.checkin,
      required this.checkout});
  final String city;
  int children1, adults;
  DateTime checkin, checkout;
  late PageController _controller;
  late Future<List<ModelClass>> futureData;
  @override
  void initState() {
    super.initState();
    futureData = fetchData();
    _controller = PageController();
  }

  Future<List<ModelClass>> fetchData() async {
    final response = await http.get(Uri.parse(topbar.ip));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => ModelClass.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 0, 179, 255),
          flexibleSpace: Container(
            decoration: BoxDecoration(),
            child: Row(
              children: [
                // IconButton(
                //     style: ButtonStyle(iconSize: MaterialStateProperty.all(10)),
                //     onPressed: () {
                //       Navigator.pop(context);
                //     },
                //     icon: Icon(Icons.arrow_back)),
                SizedBox(
                  width: 40.w,
                ),
                Positioned(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => booking()));
                    },
                    child: Container(
                        width: 250.w,
                        height: 40.h,
                        margin: EdgeInsets.only(top: 37.h, left: 10.w),
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 8,
                                  spreadRadius: 8,
                                  color: Colors.black12)
                            ],
                            color: Colors.white,
                            border: Border.all(width: 3.w, color: Colors.black),
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.search),
                              color: Colors.black,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '\t  Where To?',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 12),
                                ),
                                Text(
                                  '\t  Anywhere - Any Week - Add Guests',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: Colors.black, fontSize: 10),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                ),
                SizedBox(
                  width: 00.w,
                ),
                Container(
                  margin: EdgeInsets.only(top: 35.h),
                  child: Positioned(
                      child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => settings()));
                    },
                    color: Colors.white,
                    icon: const Icon(Icons.settings),
                  )),
                )
              ],
            ),
          ),
          bottom: TabBar(isScrollable: true, tabs: [
            Tab(
                child: Container(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {},
                    icon: Icon(Icons.hotel),
                    color: Colors.white,
                  ),
                  const Text(
                    'Hotel',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )
                ],
              ),
            )),
            Tab(
                child: Container(
              width: 155,
              child: Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {},
                    icon: Icon(Icons.apartment),
                    color: Colors.white,
                  ),
                  const Text(
                    'Apartments',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )
                ],
              ),
            )),
            Tab(
                child: Container(
              width: 110,
              child: Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {},
                    icon: Icon(Icons.home),
                    color: Colors.white,
                  ),
                  const Text(
                    'Resort',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )
                ],
              ),
            )),
            Tab(
                child: Container(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {},
                    icon: Icon(Icons.hotel),
                    color: Colors.white,
                  ),
                  const Text(
                    'Yacht',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )
                ],
              ),
            )),
            Tab(
                child: Container(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {},
                    icon: Icon(Icons.hotel),
                    color: Colors.white,
                  ),
                  const Text(
                    'cabin',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )
                ],
              ),
            )),
          ]),
        ),
        body: FutureBuilder<List<ModelClass>>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return TabBarView(children: [
                Container(
                    child: hotel1(
                  controller: _controller,
                  city2: city,
                  adults: adults,
                  children1: children1,
                  checkin: checkin,
                  checkout: checkout,
                )),
                Container(
                    color: Colors.white,
                    child: apartment1(
                      controller: _controller,
                      city: city,
                      adults: adults,
                      children1: children1,
                      checkin: checkin,
                      checkout: checkout,
                    )),
                Container(
                    color: Colors.white,
                    child: resort1(
                      controller: _controller,
                      city: city,
                      adults: adults,
                      children1: children1,
                      checkin: checkin,
                      checkout: checkout,
                    )),
                Container(
                    color: Colors.white,
                    child: yacht1(
                      controller: _controller,
                      city: city,
                      adults: adults,
                      children1: children1,
                      checkin: checkin,
                      checkout: checkout,
                    )),
                Container(
                    color: Colors.white,
                    child: cabin1(
                      controller: _controller,
                      city: city,
                      adults: adults,
                      children1: children1,
                      checkin: checkin,
                      checkout: checkout,
                    )),
              ]);
            }
          },
        ),
      ),
    );
  }
}

class carddescrphotel1 extends StatelessWidget {
  final int children1, adults;
  final DateTime checkin, checkout;

  const carddescrphotel1(
      {Key? key,
      required this.listcard,
      required this.city1,
      required this.adults,
      required this.children1,
      required this.checkin,
      required this.checkout})
      : super(key: key);
  final ModelClass listcard;
  final String city1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Color.fromARGB(255, 0, 179, 255),
                  padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                  child: Row(
                    children: [
                      IconButton(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back)),
                      Container(
                        child: Text(
                          listcard.title!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.h),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    height: 280.h,
                    width: 310.w,
                    padding: EdgeInsets.only(top: 0.h),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 8,
                              blurRadius: 8)
                        ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 250.h,
                          width: 250.w,
                          child: PageView(
                            children: [
                              Container(
                                height: 250.h,
                                width: 250.w,
                                margin: EdgeInsets.only(
                                  top: 20.h,
                                ),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          listcard.pic2!,
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                height: 300.h,
                                width: 330.w,
                                margin: EdgeInsets.only(
                                  top: 20.h,
                                ),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          listcard.pic1!,
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 0.h,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 200.w,
                      padding: EdgeInsets.only(top: 20.h, left: 35.w),
                      decoration: BoxDecoration(),
                      child: Text(
                        city1,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => receipt(
                                        value: city1,
                                        adults: adults,
                                        children1: children1,
                                        checkin: checkin,
                                        checkout: checkout,
                                      )));
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 5.h, bottom: 5.h, right: 20.h, left: 20.h),
                          margin: EdgeInsets.only(top: 10.h),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 179, 255),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            'Book a Stay',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ))
                  ],
                ),
                Container(
                  width: 350.w,
                  margin: EdgeInsets.only(left: 35.w, right: 20.w, top: 20.h),
                  child: Text(
                    listcard.detailedDescription!,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.normal, color: Colors.black),
                  ),
                ),
                Container(
                    width: 300.w,
                    height: 50.h,
                    margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 4,
                              spreadRadius: 2,
                              color: Colors.black26)
                        ],
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      width: 300.w,
                      height: 50.h,
                      padding:
                          EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.w),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          Text(
                            listcard.phone!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.black),
                          ),
                          SizedBox(
                            width: 100.w,
                          ),
                          IconButton(
                              color: Colors.black,
                              onPressed: () {},
                              icon: Icon(Icons.message)),
                          IconButton(
                              color: Colors.black,
                              onPressed: () {},
                              icon: Icon(Icons.phone))
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class hotel1 extends StatefulWidget {
  final int children1, adults;
  final DateTime checkin, checkout;

  const hotel1(
      {super.key,
      required PageController controller,
      required this.city2,
      required this.adults,
      required this.children1,
      required this.checkin,
      required this.checkout})
      : _controller = controller;

  final PageController _controller;
  final String city2;

  @override
  State<hotel1> createState() => _hotelState(
      city3: city2,
      adults: adults,
      children1: children1,
      checkin: checkin,
      checkout: checkout);
}

class _hotelState extends State<hotel1> {
  late Future<List<ModelClass>> futureData;
  _hotelState(
      {required this.city3,
      required this.adults,
      required this.children1,
      required this.checkin,
      required this.checkout});
  final String city3;
  final int children1, adults;
  final DateTime checkin, checkout;
  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  Future<List<ModelClass>> fetchData() async {
    final response = await http.get(Uri.parse(topbar.ip));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => ModelClass.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FutureBuilder<List<ModelClass>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final data = snapshot.data![index];
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => carddescrphotel1(
                                    listcard: data,
                                    city1: city3,
                                    adults: adults,
                                    children1: children1,
                                    checkin: checkin,
                                    checkout: checkout,
                                  )));
                    },
                    child: Container(
                        margin: EdgeInsets.all(15),
                        height: 400.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 8,
                                  spreadRadius: 8,
                                  color: Colors.black12)
                            ],
                            border: Border.all(width: 0, color: Colors.white),
                            borderRadius: BorderRadius.circular(30)),
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 260.h,
                                      width: 280.w,
                                      child: PageView(
                                        controller: widget._controller,
                                        children: [
                                          Container(
                                            height: 300.h,
                                            width: 300.w,
                                            margin: EdgeInsets.only(
                                              top: 10.h,
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                      data.pic2!,
                                                    ),
                                                    fit: BoxFit.cover)),
                                          ),
                                          Container(
                                            height: 300.h,
                                            width: 300.w,
                                            margin: EdgeInsets.only(
                                              top: 10.h,
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                      data.pic1!,
                                                    ),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0.h,
                                    ),
                                    SmoothPageIndicator(
                                      axisDirection: Axis.horizontal,
                                      controller: widget._controller,
                                      count: 2,
                                      effect: const JumpingDotEffect(
                                          dotHeight: 10,
                                          dotWidth: 10,
                                          verticalOffset: 30),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 20.w),
                                    width: 250,
                                    child: Text(
                                      data.title!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 30.w),
                                    width: 80.w,
                                    child: Text(
                                      data.price!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 20.w, top: 10.h),
                                    width: 250,
                                    child: Text(
                                      data.description!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 20.w, top: 5.h),
                                    width: 200,
                                    child: Text(
                                      city3,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class apartment1 extends StatefulWidget {
  const apartment1(
      {super.key,
      required PageController controller,
      required this.city,
      required this.adults,
      required this.children1,
      required this.checkin,
      required this.checkout})
      : _controller = controller;

  final PageController _controller;
  final String city;
  final int children1, adults;
  final DateTime checkin, checkout;

  @override
  State<apartment1> createState() => _apartment(
      city: city,
      adults: adults,
      children1: children1,
      checkin: checkin,
      checkout: checkout);
}

class _apartment extends State<apartment1> {
  late Future<List<ModelClass>> futureData;
  _apartment(
      {required this.city,
      required this.adults,
      required this.children1,
      required this.checkin,
      required this.checkout});
  final String city;
  final int children1, adults;
  final DateTime checkin, checkout;
  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  Future<List<ModelClass>> fetchData() async {
    final response = await http.get(Uri.parse(topbar.ip));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => ModelClass.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FutureBuilder<List<ModelClass>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final data = snapshot.data![index];
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => carddescrapartment1(
                                    listcard: data,
                                    city: city,
                                    adults: adults,
                                    children1: children1,
                                    checkin: checkin,
                                    checkout: checkout,
                                  )));
                    },
                    child: Container(
                        margin: EdgeInsets.all(15),
                        height: 400.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 8,
                                  spreadRadius: 8,
                                  color: Colors.black12)
                            ],
                            border: Border.all(width: 5, color: Colors.white),
                            borderRadius: BorderRadius.circular(30)),
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 255.h,
                                      width: 300.w,
                                      child: PageView(
                                        controller: widget._controller,
                                        children: [
                                          Container(
                                            height: 300.h,
                                            width: 300.w,
                                            margin: EdgeInsets.only(
                                              top: 10.h,
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                    image:
                                                        AssetImage(data.pic4!),
                                                    fit: BoxFit.cover)),
                                          ),
                                          Container(
                                            height: 300.h,
                                            width: 300.w,
                                            margin: EdgeInsets.only(
                                              top: 10.h,
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                      data.pic3!,
                                                    ),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0.h,
                                    ),
                                    SmoothPageIndicator(
                                      axisDirection: Axis.horizontal,
                                      controller: widget._controller,
                                      count: 2,
                                      effect: const JumpingDotEffect(
                                          dotHeight: 10,
                                          dotWidth: 10,
                                          verticalOffset: 30),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 20.w),
                                    width: 250,
                                    child: Text(
                                      data.apartment!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 30.w),
                                    width: 70.w,
                                    child: Text(
                                      data.price!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 20.w, top: 5.h),
                                    width: 250,
                                    child: Text(
                                      data.apartdesc!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 20.w, top: 5.h),
                                    width: 200,
                                    child: Text(
                                      city,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

// ignore: camel_case_types
class carddescrapartment1 extends StatelessWidget {
  const carddescrapartment1(
      {Key? key,
      required this.listcard,
      required this.city,
      required this.adults,
      required this.children1,
      required this.checkin,
      required this.checkout})
      : super(key: key);
  final ModelClass listcard;
  final String city;
  final int children1, adults;
  final DateTime checkin, checkout;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Color.fromARGB(255, 0, 179, 255),
                  padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                  child: Row(
                    children: [
                      IconButton(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back)),
                      Container(
                        child: Text(
                          listcard.apartment!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.h),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    height: 280.h,
                    width: 310.w,
                    padding: EdgeInsets.only(top: 0.h),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 8,
                              blurRadius: 8)
                        ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 250.h,
                          width: 250.w,
                          child: PageView(
                            children: [
                              Container(
                                height: 250.h,
                                width: 250.w,
                                margin: EdgeInsets.only(
                                  top: 20.h,
                                ),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          listcard.pic4!,
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                height: 300.h,
                                width: 330.w,
                                margin: EdgeInsets.only(
                                  top: 0.h,
                                ),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          listcard.pic3!,
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 0.h,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 200.w,
                      padding: EdgeInsets.only(top: 20.h, left: 35.w),
                      decoration: BoxDecoration(),
                      child: Text(
                        city,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => receipt(
                                        value: city,
                                        adults: adults,
                                        children1: children1,
                                        checkin: checkin,
                                        checkout: checkout,
                                      )));
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 5.h, bottom: 5.h, right: 20.h, left: 20.h),
                          margin: EdgeInsets.only(top: 10.h),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 179, 255),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            'Book a Stay',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ))
                  ],
                ),
                Container(
                  width: 350.w,
                  margin: EdgeInsets.only(left: 35.w, right: 20.w, top: 20.h),
                  child: Text(
                    listcard.apartdetdesc!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.black),
                  ),
                ),
                Container(
                    width: 300.w,
                    height: 50.h,
                    margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 4,
                              spreadRadius: 2,
                              color: Colors.black26)
                        ],
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      width: 300.w,
                      height: 50.h,
                      padding:
                          EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.w),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          Text(
                            listcard.phone!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.black),
                          ),
                          SizedBox(
                            width: 100.w,
                          ),
                          IconButton(
                              color: Colors.black,
                              onPressed: () {},
                              icon: Icon(Icons.message)),
                          IconButton(
                              onPressed: () {},
                              color: Colors.black,
                              icon: Icon(Icons.phone))
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class resort1 extends StatefulWidget {
  const resort1(
      {super.key,
      required PageController controller,
      required this.city,
      required this.adults,
      required this.children1,
      required this.checkin,
      required this.checkout})
      : _controller = controller;

  final PageController _controller;
  final String city;
  final int children1, adults;
  final DateTime checkin, checkout;

  @override
  State<resort1> createState() => _resort1(
      city: city,
      adults: adults,
      children1: children1,
      checkin: checkin,
      checkout: checkout);
}

class _resort1 extends State<resort1> {
  late Future<List<ModelClass>> futureData;
  _resort1(
      {required this.city,
      required this.adults,
      required this.children1,
      required this.checkin,
      required this.checkout});
  final String city;
  final int children1, adults;
  final DateTime checkin, checkout;
  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  Future<List<ModelClass>> fetchData() async {
    final response = await http.get(Uri.parse(topbar.ip));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => ModelClass.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FutureBuilder<List<ModelClass>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final data = snapshot.data![index];
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => carddescresort1(
                                    listcard: data,
                                    city: city,
                                    adults: adults,
                                    children1: children1,
                                    checkin: checkin,
                                    checkout: checkout,
                                  )));
                    },
                    child: Container(
                        margin: EdgeInsets.all(15),
                        height: 400.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 8,
                                  spreadRadius: 8,
                                  color: Colors.black12)
                            ],
                            border: Border.all(width: 5, color: Colors.white),
                            borderRadius: BorderRadius.circular(30)),
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 260.h,
                                      width: 300.w,
                                      child: PageView(
                                        controller: widget._controller,
                                        children: [
                                          Container(
                                            height: 300.h,
                                            width: 300.w,
                                            margin: EdgeInsets.only(
                                              top: 10.h,
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                    image:
                                                        AssetImage(data.pic6!),
                                                    fit: BoxFit.cover)),
                                          ),
                                          Container(
                                            height: 300.h,
                                            width: 300.w,
                                            margin: EdgeInsets.only(
                                              top: 10.h,
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                      data.pic5!,
                                                    ),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0.h,
                                    ),
                                    SmoothPageIndicator(
                                      axisDirection: Axis.horizontal,
                                      controller: widget._controller,
                                      count: 2,
                                      effect: const JumpingDotEffect(
                                          dotHeight: 10,
                                          dotWidth: 10,
                                          verticalOffset: 30),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 20.w),
                                    width: 250,
                                    child: Text(
                                      data.resortcat!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 20.w),
                                    width: 70.w,
                                    child: Text(
                                      data.price!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 20.w, top: 10.h),
                                    width: 250,
                                    child: Text(
                                      data.resortdesc!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 20.w, top: 5.h),
                                    width: 200,
                                    child: Text(
                                      city,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class carddescresort1 extends StatelessWidget {
  const carddescresort1(
      {Key? key,
      required this.listcard,
      required this.city,
      required this.adults,
      required this.children1,
      required this.checkin,
      required this.checkout})
      : super(key: key);
  final ModelClass listcard;
  final String city;
  final int children1, adults;
  final DateTime checkin, checkout;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Color.fromARGB(255, 0, 179, 255),
                  padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                  child: Row(
                    children: [
                      IconButton(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back)),
                      Container(
                        child: Text(
                          listcard.resortcat!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.h),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    height: 280.h,
                    width: 310.w,
                    padding: EdgeInsets.only(top: 0.h),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 8,
                              blurRadius: 8)
                        ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 250.h,
                          width: 250.w,
                          child: PageView(
                            children: [
                              Container(
                                height: 250.h,
                                width: 250.w,
                                margin: EdgeInsets.only(
                                  top: 20.h,
                                ),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          listcard.pic6!,
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                height: 300.h,
                                width: 330.w,
                                margin: EdgeInsets.only(
                                  top: 0.h,
                                ),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          listcard.pic5!,
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 0.h,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 200.w,
                      padding: EdgeInsets.only(top: 20.h, left: 35.w),
                      decoration: BoxDecoration(),
                      child: Text(
                        city,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => receipt(
                                        value: city,
                                        adults: adults,
                                        children1: children1,
                                        checkin: checkin,
                                        checkout: checkout,
                                      )));
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 5.h, bottom: 5.h, right: 20.h, left: 20.h),
                          margin: EdgeInsets.only(top: 10.h),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 179, 255),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            'Book a Stay',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ))
                  ],
                ),
                Container(
                  width: 350.w,
                  margin: EdgeInsets.only(left: 35.w, right: 20.w, top: 20.h),
                  child: Text(
                    listcard.resortdetdesc!,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.normal, color: Colors.black),
                  ),
                ),
                Container(
                    width: 300.w,
                    height: 50.h,
                    margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 4,
                              spreadRadius: 2,
                              color: Colors.black26)
                        ],
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      width: 300.w,
                      height: 50.h,
                      padding:
                          EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.w),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          Text(
                            listcard.phone!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                          ),
                          SizedBox(
                            width: 100.w,
                          ),
                          IconButton(
                              color: Colors.black,
                              onPressed: () {},
                              icon: Icon(Icons.message)),
                          IconButton(
                              onPressed: () {},
                              color: Colors.black,
                              icon: Icon(Icons.phone))
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class yacht1 extends StatefulWidget {
  const yacht1(
      {super.key,
      required PageController controller,
      required this.city,
      required this.adults,
      required this.children1,
      required this.checkin,
      required this.checkout})
      : _controller = controller;

  final PageController _controller;
  final String city;
  final int children1, adults;
  final DateTime checkin, checkout;
  @override
  State<yacht1> createState() => _yacht(
      city: city,
      adults: adults,
      children1: children1,
      checkin: checkin,
      checkout: checkout);
}

class _yacht extends State<yacht1> {
  late Future<List<ModelClass>> futureData;
  _yacht(
      {required this.city,
      required this.adults,
      required this.children1,
      required this.checkin,
      required this.checkout});
  final String city;
  final int children1, adults;
  final DateTime checkin, checkout;
  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  Future<List<ModelClass>> fetchData() async {
    final response = await http.get(Uri.parse(topbar.ip));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => ModelClass.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FutureBuilder<List<ModelClass>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final data = snapshot.data![index];
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => carddescyacht1(
                                    listcard: data,
                                    city: city,
                                    adults: adults,
                                    children1: children1,
                                    checkin: checkin,
                                    checkout: checkout,
                                  )));
                    },
                    child: Container(
                        margin: EdgeInsets.all(15),
                        height: 400.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 8,
                                  spreadRadius: 8,
                                  color: Colors.black12)
                            ],
                            border: Border.all(width: 5, color: Colors.white),
                            borderRadius: BorderRadius.circular(30)),
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 260.h,
                                      width: 300.w,
                                      child: PageView(
                                        controller: widget._controller,
                                        children: [
                                          Container(
                                            height: 300.h,
                                            width: 300.w,
                                            margin: EdgeInsets.only(
                                              top: 10.h,
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                    image:
                                                        AssetImage(data.pic8!),
                                                    fit: BoxFit.cover)),
                                          ),
                                          Container(
                                            height: 300.h,
                                            width: 300.w,
                                            margin: EdgeInsets.only(
                                              top: 10.h,
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                      data.pic7!,
                                                    ),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0.h,
                                    ),
                                    SmoothPageIndicator(
                                      axisDirection: Axis.horizontal,
                                      controller: widget._controller,
                                      count: 2,
                                      effect: const JumpingDotEffect(
                                          dotHeight: 10,
                                          dotWidth: 10,
                                          verticalOffset: 30),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 20.w),
                                    width: 250,
                                    child: Text(
                                      data.yacht!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 30.w),
                                    width: 70.w,
                                    child: Text(
                                      data.price!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 20.w, top: 10.h),
                                    width: 250,
                                    child: Text(
                                      data.yachtdesc!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 20.w, top: 5.h),
                                    width: 200,
                                    child: Text(
                                      city,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class carddescyacht1 extends StatelessWidget {
  const carddescyacht1(
      {Key? key,
      required this.listcard,
      required this.city,
      required this.adults,
      required this.children1,
      required this.checkin,
      required this.checkout})
      : super(key: key);
  final ModelClass listcard;
  final String city;
  final int children1, adults;
  final DateTime checkin, checkout;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Color.fromARGB(255, 0, 179, 255),
                  padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                  child: Row(
                    children: [
                      IconButton(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back)),
                      Container(
                        child: Text(
                          listcard.yacht!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.h),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    height: 280.h,
                    width: 310.w,
                    padding: EdgeInsets.only(top: 0.h),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 8,
                              blurRadius: 8)
                        ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 250.h,
                          width: 250.w,
                          child: PageView(
                            children: [
                              Container(
                                height: 250.h,
                                width: 250.w,
                                margin: EdgeInsets.only(
                                  top: 20.h,
                                ),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          listcard.pic8!,
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                height: 300.h,
                                width: 330.w,
                                margin: EdgeInsets.only(
                                  top: 0.h,
                                ),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          listcard.pic7!,
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 0.h,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 200.w,
                      padding: EdgeInsets.only(top: 20.h, left: 35.w),
                      decoration: BoxDecoration(),
                      child: Text(
                        city,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => receipt(
                                        value: city,
                                        adults: adults,
                                        children1: children1,
                                        checkin: checkin,
                                        checkout: checkout,
                                      )));
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 5.h, bottom: 5.h, right: 20.h, left: 20.h),
                          margin: EdgeInsets.only(top: 10.h),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 179, 255),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            'Book a Stay',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ))
                  ],
                ),
                Container(
                  width: 350.w,
                  margin: EdgeInsets.only(left: 35.w, right: 20.w, top: 20.h),
                  child: Text(
                    listcard.yachtdetdesc!,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.normal, color: Colors.black),
                  ),
                ),
                Container(
                    width: 300.w,
                    height: 50.h,
                    margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 4,
                              spreadRadius: 2,
                              color: Colors.black26)
                        ],
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      width: 300.w,
                      height: 50.h,
                      padding:
                          EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.w),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          Text(
                            listcard.phone!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                          ),
                          SizedBox(
                            width: 100.w,
                          ),
                          IconButton(
                              color: Colors.black,
                              onPressed: () {},
                              icon: Icon(Icons.message)),
                          IconButton(
                              onPressed: () {},
                              color: Colors.black,
                              icon: Icon(Icons.phone))
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class cabin1 extends StatefulWidget {
  const cabin1(
      {super.key,
      required PageController controller,
      required this.city,
      required this.adults,
      required this.children1,
      required this.checkin,
      required this.checkout})
      : _controller = controller;

  final PageController _controller;
  final String city;
  final int children1, adults;
  final DateTime checkin, checkout;
  @override
  State<cabin1> createState() => _cabin(
      city: city,
      adults: adults,
      children1: children1,
      checkin: checkin,
      checkout: checkout);
}

class _cabin extends State<cabin1> {
  late Future<List<ModelClass>> futureData;
  _cabin(
      {required this.city,
      required this.adults,
      required this.children1,
      required this.checkin,
      required this.checkout});

  final String city;
  final int children1, adults;
  final DateTime checkin, checkout;
  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  Future<List<ModelClass>> fetchData() async {
    final response = await http.get(Uri.parse(topbar.ip));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => ModelClass.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FutureBuilder<List<ModelClass>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final data = snapshot.data![index];
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => carddesccabin1(
                                    listcard: data,
                                    city: city,
                                    adults: adults,
                                    children1: children1,
                                    checkin: checkin,
                                    checkout: checkout,
                                  )));
                    },
                    child: Container(
                        margin: EdgeInsets.all(15),
                        height: 400.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 8,
                                  spreadRadius: 8,
                                  color: Colors.black12)
                            ],
                            border: Border.all(width: 5, color: Colors.white),
                            borderRadius: BorderRadius.circular(30)),
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 260.h,
                                      width: 300.w,
                                      child: PageView(
                                        controller: widget._controller,
                                        children: [
                                          Container(
                                            height: 300.h,
                                            width: 300.w,
                                            margin: EdgeInsets.only(
                                              top: 10.h,
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                    image:
                                                        AssetImage(data.pic10!),
                                                    fit: BoxFit.cover)),
                                          ),
                                          Container(
                                            height: 300.h,
                                            width: 300.w,
                                            margin: EdgeInsets.only(
                                              top: 10.h,
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                      data.pic9!,
                                                    ),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0.h,
                                    ),
                                    SmoothPageIndicator(
                                      axisDirection: Axis.horizontal,
                                      controller: widget._controller,
                                      count: 2,
                                      effect: const JumpingDotEffect(
                                          dotHeight: 10,
                                          dotWidth: 10,
                                          verticalOffset: 30),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 20.w),
                                    width: 250,
                                    child: Text(
                                      data.cabincat!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 30.w),
                                    width: 70.w,
                                    child: Text(
                                      data.price!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 20.w, top: 0.h),
                                    width: 250,
                                    child: Text(
                                      data.cabindesc!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 20.w, top: 5.h),
                                    width: 200,
                                    child: Text(
                                      city,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class carddesccabin1 extends StatelessWidget {
  const carddesccabin1(
      {Key? key,
      required this.listcard,
      required this.city,
      required this.adults,
      required this.children1,
      required this.checkin,
      required this.checkout})
      : super(key: key);
  final ModelClass listcard;
  final String city;
  final int children1, adults;
  final DateTime checkin, checkout;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Color.fromARGB(255, 0, 179, 255),
                  padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                  child: Row(
                    children: [
                      IconButton(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back)),
                      Container(
                        child: Text(
                          listcard.cabincat!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.h),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    height: 280.h,
                    width: 310.w,
                    padding: EdgeInsets.only(top: 0.h),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 8,
                              blurRadius: 8)
                        ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 250.h,
                          width: 250.w,
                          child: PageView(
                            children: [
                              Container(
                                height: 250.h,
                                width: 250.w,
                                margin: EdgeInsets.only(
                                  top: 20.h,
                                ),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          listcard.pic10!,
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                height: 300.h,
                                width: 330.w,
                                margin: EdgeInsets.only(
                                  top: 0.h,
                                ),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          listcard.pic9!,
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 0.h,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 200.w,
                      padding: EdgeInsets.only(top: 20.h, left: 35.w),
                      decoration: BoxDecoration(),
                      child: Text(
                        city,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => receipt(
                                        value: city,
                                        adults: adults,
                                        children1: children1,
                                        checkin: checkin,
                                        checkout: checkout,
                                      )));
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 5.h, bottom: 5.h, right: 20.h, left: 20.h),
                          margin: EdgeInsets.only(top: 10.h),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 179, 255),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            'Book a Stay',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ))
                  ],
                ),
                Container(
                  width: 350.w,
                  margin: EdgeInsets.only(left: 35.w, right: 20.w, top: 20.h),
                  child: Text(
                    listcard.cabindetdesc!,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.normal, color: Colors.black),
                  ),
                ),
                Container(
                    width: 300.w,
                    height: 50.h,
                    margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 4,
                              spreadRadius: 2,
                              color: Colors.black26)
                        ],
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      width: 300.w,
                      height: 50.h,
                      padding:
                          EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.w),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          Text(
                            listcard.phone!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.black),
                          ),
                          SizedBox(
                            width: 100.w,
                          ),
                          IconButton(
                              color: Colors.black,
                              onPressed: () {},
                              icon: Icon(Icons.message)),
                          IconButton(
                              onPressed: () {},
                              color: Colors.black,
                              icon: Icon(Icons.phone))
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class booking1 extends StatefulWidget {
  const booking1({super.key, required this.city});
  final String city;
  @override
  State<booking1> createState() => _bookingState1(city: city);
}

// ignore: camel_case_types
class _bookingState1 extends State<booking1> {
  _bookingState1({required this.city});
  final String city;
  DateTime dateTime = DateTime.now();
  DateTime dateTime2 = DateTime.now();
  String dropdownvalue = 'Tokyo,Japan';
  int adults = 0;
  int children1 = 0;

  void _showdatepicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  background: Colors.white,
                ),
                textTheme: const TextTheme(
                    bodyLarge: TextStyle(fontSize: 20, color: Colors.black))),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50.h),
                  child: Container(
                    height: 400.h,
                    width: 350.w,
                    child: child,
                  ),
                )
              ],
            ));
      },
    ).then((value) {
      setState(() {
        dateTime = value!;
      });
    });
  }

  void _showdatepicker2() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  background: Colors.white,
                ),
                textTheme: const TextTheme(
                    bodyLarge: TextStyle(fontSize: 20, color: Colors.black))),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50.h),
                  child: Container(
                    height: 400.h,
                    width: 350.w,
                    child: child,
                  ),
                )
              ],
            ));
      },
    ).then((value) {
      setState(() {
        dateTime2 = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Stack(
            children: [
              Container(
                color: Color.fromARGB(255, 0, 179, 255),
              ),
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/sss.png'),
                        fit: BoxFit.cover)),
                margin: EdgeInsets.only(top: 20.h),
              ),
              Container(
                padding: EdgeInsets.only(top: 0.h),
                // color: Color.fromARGB(200, 255, 255, 255),
                color: Color.fromARGB(135, 255, 255, 255),
                child: Container(
                  margin: EdgeInsets.only(
                      top: 60.h, bottom: 50.h, right: 20.w, left: 20.w),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white),
                      boxShadow: const [
                        BoxShadow(
                            spreadRadius: 8,
                            blurRadius: 8,
                            color: Colors.black12)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.cancel)),
                          SizedBox(
                            width: 70.w,
                          ),
                          Text(
                            'booking',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      GestureDetector(
                        onTap: _showdatepicker,
                        child: Column(
                          children: [
                            Container(
                              width: 190.w,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(),
                              child: Text(
                                'Select Checkin Date',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                                width: 170.w,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1, color: Colors.black),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                          spreadRadius: 4,
                                          blurRadius: 16,
                                          color: Colors.black12)
                                    ]),
                                child: Row(
                                  children: [
                                    Text(
                                      '${dateTime.day},${dateTime.month},${dateTime.year}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: Colors.black,
                                              fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: 50.w,
                                    ),
                                    Icon(Icons.calendar_month)
                                  ],
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      GestureDetector(
                        onTap: _showdatepicker2,
                        child: Column(
                          children: [
                            Container(
                              width: 200.w,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(),
                              child: Text(
                                'Select Checkout Date',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                                width: 170.w,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1, color: Colors.black),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                          spreadRadius: 4,
                                          blurRadius: 16,
                                          color: Colors.black12)
                                    ]),
                                child: Row(
                                  children: [
                                    Text(
                                      '${dateTime2.day},${dateTime2.month},${dateTime2.year}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: Colors.black,
                                              fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: 50.w,
                                    ),
                                    Icon(Icons.calendar_month)
                                  ],
                                )),
                            SizedBox(
                              height: 30.h,
                            ),
                          ],
                        ),
                      ),
                      Material(
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    spreadRadius: 4,
                                    blurRadius: 16,
                                    color: Colors.black12)
                              ]),
                          width: 180.w,
                          child: DropdownButton(
                              iconSize: 30,
                              isExpanded: true,
                              items: const [
                                DropdownMenuItem(
                                    child: Text('Rio de janeiro,Brazil'),
                                    value: 'Rio de janeiro,Brazil'),
                                DropdownMenuItem(
                                    child: Text('Denmark,Germany'),
                                    value: 'Denmark,Germany'),
                                DropdownMenuItem(
                                    child: Text('London,UK'),
                                    value: 'London,UK'),
                                DropdownMenuItem(
                                    child: Text('Paris,France'),
                                    value: 'Paris,France'),
                                DropdownMenuItem(
                                    child: Text('Tokyo,Japan'),
                                    value: 'Tokyo,Japan'),
                                DropdownMenuItem(
                                    child: Text('Newyork,USA'),
                                    value: 'Newyork,USA'),
                                DropdownMenuItem(
                                    child: Text('LA,USA'), value: 'LA,USA'),
                                DropdownMenuItem(
                                    child: Text('Miami,USA'),
                                    value: 'Miami,USA'),
                                DropdownMenuItem(
                                    child: Text('Berlin,Germany'),
                                    value: 'Berlin,Germany'),
                              ],
                              value: city,
                              onChanged: (String? val) {
                                setState(() {
                                  dropdownvalue = val!;
                                });
                              }),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'ADD GUESTS',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 80.w,
                          ),
                          Text(
                            'Adults:',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: 20, color: Colors.black),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(
                            height: 30.h,
                            width: 30.h,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 0, 179, 255),
                                border:
                                    Border.all(width: 1, color: Colors.black),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20))),
                            child: Center(
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      adults--;
                                    });
                                  },
                                  icon: Icon(Icons.remove)),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5.w, right: 5.w),
                            child: Text(
                              '${adults}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontSize: 20, color: Colors.black),
                            ),
                          ),
                          Container(
                            height: 30.h,
                            width: 30.h,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 0, 179, 255),
                                border:
                                    Border.all(width: 1, color: Colors.black),
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            child: Center(
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      adults++;
                                    });
                                  },
                                  icon: Icon(Icons.add)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 60.w,
                          ),
                          Text(
                            'Children:',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: 20, color: Colors.black),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(
                            height: 30.h,
                            width: 30.h,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 0, 179, 255),
                                border:
                                    Border.all(width: 1, color: Colors.black),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20))),
                            child: Center(
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      children1--;
                                    });
                                  },
                                  icon: Icon(Icons.remove)),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5.w, right: 5.w),
                            child: Text(
                              '${children1}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontSize: 20, color: Colors.black),
                            ),
                          ),
                          Container(
                            height: 30.h,
                            width: 30.h,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 0, 179, 255),
                                border:
                                    Border.all(width: 1, color: Colors.black),
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            child: Center(
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      children1++;
                                    });
                                  },
                                  icon: Icon(Icons.add)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => receipt(
                                        value: dropdownvalue,
                                        adults: adults,
                                        children1: children1,
                                        checkin: dateTime,
                                        checkout: dateTime2)));
                          },
                          child: Container(
                            width: 200.w,
                            height: 40.h,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 0, 179, 255),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Center(
                              child: Text(
                                'Submit',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
