// ignore_for_file: unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectry/ModelClass.dart';
import 'package:projectry/booking%20details.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const homeapp());
}

// ignore: camel_case_types
class homeapp extends StatelessWidget {
  const homeapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: const TextTheme(
                bodySmall: TextStyle(color: Colors.black),
                bodyMedium: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                bodyLarge: TextStyle(
                    color: Color.fromARGB(255, 0, 179, 255), fontSize: 40)),
            brightness: Brightness.light,
            colorScheme: const ColorScheme.light(
              background: Colors.white,
              primary: Color.fromARGB(255, 0, 179, 255),
            ),
          ),
          darkTheme: ThemeData(
            textTheme: const TextTheme(
              bodySmall: TextStyle(color: Colors.white),
              bodyLarge: TextStyle(
                  color: Color.fromARGB(255, 0, 179, 255), fontSize: 40),
            ),
            brightness: Brightness.dark,
            colorScheme: const ColorScheme.dark(
              background: Color.fromARGB(255, 50, 50, 50),
              primary: Color.fromARGB(255, 0, 179, 255),
            ),
          ),
          home: topbar()),
    );
  }
}

class topbar extends StatefulWidget {
  topbar({super.key});
  static String ip = 'http://192.168.10.14:3000';
  //10.135.98.96
  @override
  State<topbar> createState() => _topbarState();
}

class _topbarState extends State<topbar> {
  late Future<List<ModelClass>> futureData;

  late PageController _controller;

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
                Container(child: hotel(controller: _controller)),
                Container(
                    color: Colors.white,
                    child: apartment(controller: _controller)),
                Container(
                    color: Colors.white,
                    child: resort(controller: _controller)),
                Container(
                    color: Colors.white, child: yacht(controller: _controller)),
                Container(
                    color: Colors.white, child: cabin(controller: _controller)),
              ]);
            }
          },
        ),
      ),
    );
  }
}

class carddescrphotel extends StatelessWidget {
  const carddescrphotel({Key? key, required this.listcard}) : super(key: key);
  final ModelClass listcard;
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
                                          listcard.pic1!,
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
                                          listcard.pic2!,
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
                        listcard.city!,
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
                                  builder: (context) => booking1(
                                        city: listcard.city!,
                                      )));
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 5.h, bottom: 5.h, right: 10.h, left: 20.h),
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
                            width: 50.w,
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
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class hotel extends StatefulWidget {
  const hotel({
    super.key,
    required PageController controller,
  }) : _controller = controller;

  final PageController _controller;

  @override
  State<hotel> createState() => _hotelState();
}

class _hotelState extends State<hotel> {
  late Future<List<ModelClass>> futureData;

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
                              builder: (context) => carddescrphotel(
                                    listcard: data,
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
                                                      data.pic1!,
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
                                                      data.pic2!,
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
                                      data.city!,
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

class apartment extends StatefulWidget {
  const apartment({
    super.key,
    required PageController controller,
  }) : _controller = controller;

  final PageController _controller;

  @override
  State<apartment> createState() => _apartment();
}

class _apartment extends State<apartment> {
  late Future<List<ModelClass>> futureData;

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
                              builder: (context) => carddescrapartment(
                                    listcard: data,
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
                                                        AssetImage(data.pic3!),
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
                                                      data.pic4!,
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
                                      data.city!,
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

class carddescrapartment extends StatelessWidget {
  const carddescrapartment({Key? key, required this.listcard})
      : super(key: key);
  final ModelClass listcard;
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
                                          listcard.pic3!,
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
                                          listcard.pic4!,
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
                        listcard.city!,
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
                                  builder: (context) => booking1(
                                        city: listcard.city!,
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

class resort extends StatefulWidget {
  const resort({
    super.key,
    required PageController controller,
  }) : _controller = controller;

  final PageController _controller;

  @override
  State<resort> createState() => _resort();
}

class _resort extends State<resort> {
  late Future<List<ModelClass>> futureData;

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
                              builder: (context) => carddescresort(
                                    listcard: data,
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
                                                        AssetImage(data.pic5!),
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
                                                      data.pic6!,
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
                                      data.city!,
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

class carddescresort extends StatelessWidget {
  const carddescresort({Key? key, required this.listcard}) : super(key: key);
  final ModelClass listcard;
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
                                          listcard.pic5!,
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
                                          listcard.pic6!,
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
                        listcard.city!,
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
                                  builder: (context) => booking1(
                                        city: listcard.city!,
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

class yacht extends StatefulWidget {
  const yacht({
    super.key,
    required PageController controller,
  }) : _controller = controller;

  final PageController _controller;

  @override
  State<yacht> createState() => _yacht();
}

class _yacht extends State<yacht> {
  late Future<List<ModelClass>> futureData;

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
                              builder: (context) => carddescyacht(
                                    listcard: data,
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
                                                        AssetImage(data.pic7!),
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
                                                      data.pic8!,
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
                                      data.city!,
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

class carddescyacht extends StatelessWidget {
  const carddescyacht({Key? key, required this.listcard}) : super(key: key);
  final ModelClass listcard;
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
                                          listcard.pic7!,
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
                                          listcard.pic8!,
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
                        listcard.city!,
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
                                  builder: (context) => booking1(
                                        city: listcard.city!,
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

class cabin extends StatefulWidget {
  const cabin({
    super.key,
    required PageController controller,
  }) : _controller = controller;

  final PageController _controller;

  @override
  State<cabin> createState() => _cabin();
}

class _cabin extends State<cabin> {
  late Future<List<ModelClass>> futureData;

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
                              builder: (context) => carddesccabin(
                                    listcard: data,
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
                                                        AssetImage(data.pic9!),
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
                                                      data.pic10!,
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
                                      data.city!,
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

class carddesccabin extends StatelessWidget {
  const carddesccabin({Key? key, required this.listcard}) : super(key: key);
  final ModelClass listcard;
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
                                          listcard.pic9!,
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
                                          listcard.pic10!,
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
                        listcard.city!,
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
                                  builder: (context) => booking1(
                                        city: listcard.city!,
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

class users {
  final String pic1;
  final String pic2;
  final String title;
  final String description;
  final String price;
  final String city;
  final String detaildescription;
  final String phone;

  users(this.pic1, this.pic2, this.title, this.description, this.price,
      this.city, this.detaildescription, this.phone);
}

List<users> userslist = [
  users(
      'images/11.jpeg',
      'images/12.jpeg',
      'super Deluxe Suite',
      "Provides additional space and amenities to standard rooms.",
      '€89',
      'Lahore,Pakistan',
      'Indulge in luxury with our Deluxe Suite, offering a spacious and elegantly designed living space. The suite includes a plush king-sized bed, a separate living area with a stylish sofa and coffee table, and a private balcony with scenic views. Pamper yourself in the well-appointed bathroom with a deep soaking tub and premium toiletries. Complimentary access to our exclusive lounge adds an extra touch of refinement to your experience.',
      '+92 305 1234567'),
  users(
      'images/21.jpeg',
      'images/22.jpeg',
      'luxury suite',
      "Offers top-tier amenities, multiple bedrooms, and premium furnishings.",
      '€49',
      'Islamabad,Pakistan',
      'Step into opulence with our Presidential Suite, a luxurious retreat for the discerning traveler. This expansive suite boasts a master bedroom with a king-sized bed, a separate living and dining area, a private kitchenette, and a fully equipped office space. The suite is adorned with upscale furnishings, fine art, and panoramic windows offering breathtaking views. Enjoy personalized concierge service, complimentary airport transfers, and access to our exclusive amenities.',
      '+44 345 1234567'),
  users(
      'images/31.jpeg',
      'images/32.jpeg',
      'executive suite',
      "Geared towards business travelers.amenities such as work desk",
      '€69',
      'London,UK',
      'Experience the pinnacle of sophistication in our Executive Suite. This tastefully decorated suite offers a separate bedroom with a luxurious king-sized bed, a spacious living area with stylish furnishings, and a private dining area. Enjoy exclusive access to our executive lounge, where complimentary breakfast and evening cocktails are served. The suite also includes a well-appointed work desk, making it ideal for business travelers.',
      '+91 335 1234567'),
  users(
      'images/41.jpeg',
      'images/42.jpeg',
      'standard suite',
      "Indulgent suite with a separate living area, perfect for a luxurious experience.",
      '€12',
      'Newyork,USA',
      'Welcome to our cozy Standard Room, where simplicity meets comfort. The room features a comfortable queen-sized bed with premium linens, ensuring a restful nights sleep. Enjoy modern amenities such as a flat-screen TV, complimentary Wi-Fi, and a well-appointed work desk. The soothing color palette and tasteful decor create a tranquil atmosphere for your stay.',
      '+92 305 1923847'),
  users(
      'images/51.jpeg',
      'images/52.jpeg',
      'Deluxe Room',
      "Provides additional space and amenities compared to standard rooms.",
      '€89',
      'LA,USA',
      "Indulge in luxury with our Deluxe Suite, offering a spacious and elegantly designed living space. The suite includes a plush king-sized bed, a separate living area with a stylish sofa and coffee table, and a private balcony with scenic views. Pamper yourself in the well-appointed bathroom with a deep soaking tub and premium toiletries. Complimentary access to our exclusive lounge adds an extra touch of refinement to your experience.",
      '+91 305 4567123'),
  users(
      'images/61.jpeg',
      'images/62.jpeg',
      'luxury suite',
      "Offers top-tier amenities, multiple bedrooms, and premium furnishings.",
      '€49',
      'Miami,USA',
      "Step into opulence with our Presidential Suite, a luxurious retreat for the discerning traveler. This expansive suite boasts a master bedroom with a king-sized bed, a separate living and dining area, a private kitchenette, and a fully equipped office space. The suite is adorned with upscale furnishings, fine art, and panoramic windows offering breathtaking views. Enjoy personalized concierge service, complimentary airport transfers, and access to our exclusive amenities.",
      '+44 305 8209145'),
  users(
      'images/71.jpeg',
      'images/72.jpeg',
      'super deluxe suite',
      "Geared towards business travelers.amenities such as a work desk,",
      '€69',
      'Berlin,Germany',
      "Indulge in luxury with our Deluxe Suite, offering a spacious and elegantly designed living space. The suite includes a plush king-sized bed, a separate living area with a stylish sofa and coffee table, and a private balcony with scenic views. Pamper yourself in the well-appointed bathroom with a deep soaking tub and premium toiletries. Complimentary access to our exclusive lounge adds an extra touch of refinement to your experience.",
      '+965 322 1723456'),
  users(
      'images/81.jpeg',
      'images/82.jpeg',
      'standard suite',
      "Indulgent suite with a separate living area, perfect for a luxurious experience.",
      '€12',
      'Amsterdam,netherland',
      "Welcome to our cozy Standard Room, where simplicity meets comfort. The room features a comfortable queen-sized bed with premium linens, ensuring a restful night's sleep. Enjoy modern amenities such as a flat-screen TV, complimentary Wi-Fi, and a well-appointed work desk. The soothing color palette and tasteful decor create a tranquil atmosphere for your stay.",
      '+965 309 9283745'),
  users(
      'images/91.jpeg',
      'images/92.jpeg',
      'super Deluxe Room',
      "Provides additional space and amenities to standard rooms.",
      '€89',
      'Tokyo,Japan',
      "Indulge in luxury with our Deluxe Suite, offering a spacious and elegantly designed living space. The suite includes a plush king-sized bed, a separate living area with a stylish sofa and coffee table, and a private balcony with scenic views. Pamper yourself in the well-appointed bathroom with a deep soaking tub and premium toiletries. Complimentary access to our exclusive lounge adds an extra touch of refinement to your experience.",
      '+92 323 4512367'),
  users(
      'images/101.jpeg',
      'images/102.jpeg',
      'luxury suite',
      "Offers top-tier amenities, multiple bedrooms, and premium furnishings.",
      '€49',
      'Paris,France',
      "Step into opulence with our Presidential Suite, a luxurious retreat for the discerning traveler. This expansive suite boasts a master bedroom with a king-sized bed, a separate living and dining area, a private kitchenette, and a fully equipped office space. The suite is adorned with upscale furnishings, fine art, and panoramic windows offering breathtaking views. Enjoy personalized concierge service, complimentary airport transfers, and access to our exclusive amenities.",
      '+91 335 8932567'),
];

List<users> userslist1 = [
  users(
      'images/a1.jpeg',
      'images/a2.jpeg',
      'super Deluxe Suite',
      "Provides additional space and amenities to standard rooms.",
      '€89',
      'Lahore,Pakistan',
      'Indulge in luxury with our Deluxe Suite, offering a spacious and elegantly designed living space. The suite includes a plush king-sized bed, a separate living area with a stylish sofa and coffee table, and a private balcony with scenic views. Pamper yourself in the well-appointed bathroom with a deep soaking tub and premium toiletries. Complimentary access to our exclusive lounge adds an extra touch of refinement to your experience.',
      '+44 312 0534567'),
  users(
      'images/b1.jpeg',
      'images/b2.jpeg',
      'luxury suite',
      "Offers top-tier amenities, multiple bedrooms, and premium furnishings.",
      '€49',
      'Islamabad,Pakistan',
      'Step into opulence with our Presidential Suite, a luxurious retreat for the discerning traveler. This expansive suite boasts a master bedroom with a king-sized bed, a separate living and dining area, a private kitchenette, and a fully equipped office space. The suite is adorned with upscale furnishings, fine art, and panoramic windows offering breathtaking views. Enjoy personalized concierge service, complimentary airport transfers, and access to our exclusive amenities.',
      '+91 347 9843174'),
  users(
      'images/c1.jpeg',
      'images/c2.jpeg',
      'executive suite',
      "Geared towards business travelers.amenities such as work desk",
      '€69',
      'London,UK',
      'Experience the pinnacle of sophistication in our Executive Suite. This tastefully decorated suite offers a separate bedroom with a luxurious king-sized bed, a spacious living area with stylish furnishings, and a private dining area. Enjoy exclusive access to our executive lounge, where complimentary breakfast and evening cocktails are served. The suite also includes a well-appointed work desk, making it ideal for business travelers.',
      '+44 325 5357355'),
  users(
      'images/d1.jpeg',
      'images/d2.jpeg',
      'standard suite',
      "Indulgent suite with a separate living area, perfect for a luxurious experience.",
      '€12',
      'Newyork,USA',
      'Welcome to our cozy Standard Room, where simplicity meets comfort. The room features a comfortable queen-sized bed with premium linens, ensuring a restful nights sleep. Enjoy modern amenities such as a flat-screen TV, complimentary Wi-Fi, and a well-appointed work desk. The soothing color palette and tasteful decor create a tranquil atmosphere for your stay.',
      '+92 789 4567890'),
  users(
      'images/e1.jpeg',
      'images/e2.jpeg',
      'Deluxe Room',
      "Provides additional space and amenities compared to standard rooms.",
      '€89',
      'LA,USA',
      "Indulge in luxury with our Deluxe Suite, offering a spacious and elegantly designed living space. The suite includes a plush king-sized bed, a separate living area with a stylish sofa and coffee table, and a private balcony with scenic views. Pamper yourself in the well-appointed bathroom with a deep soaking tub and premium toiletries. Complimentary access to our exclusive lounge adds an extra touch of refinement to your experience.",
      '+92 234 5678901'),
  users(
      'images/f1.jpeg',
      'images/f2.jpeg',
      'luxury suite',
      "Offers top-tier amenities, multiple bedrooms, and premium furnishings.",
      '€49',
      'Miami,USA',
      "Step into opulence with our Presidential Suite, a luxurious retreat for the discerning traveler. This expansive suite boasts a master bedroom with a king-sized bed, a separate living and dining area, a private kitchenette, and a fully equipped office space. The suite is adorned with upscale furnishings, fine art, and panoramic windows offering breathtaking views. Enjoy personalized concierge service, complimentary airport transfers, and access to our exclusive amenities.",
      '+44 234 5671809'),
  users(
      'images/g1.jpeg',
      'images/g2.jpeg',
      'super deluxe suite',
      "Geared towards business travelers.amenities such as a work desk,",
      '€69',
      'Berlin,Germany',
      "Indulge in luxury with our Deluxe Suite, offering a spacious and elegantly designed living space. The suite includes a plush king-sized bed, a separate living area with a stylish sofa and coffee table, and a private balcony with scenic views. Pamper yourself in the well-appointed bathroom with a deep soaking tub and premium toiletries. Complimentary access to our exclusive lounge adds an extra touch of refinement to your experience.",
      '+965 321 9876543'),
  users(
      'images/h1.jpeg',
      'images/h2.jpeg',
      'standard suite',
      "Indulgent suite with a separate living area, perfect for a luxurious experience.",
      '€12',
      'Amsterdam,netherland',
      "Welcome to our cozy Standard Room, where simplicity meets comfort. The room features a comfortable queen-sized bed with premium linens, ensuring a restful night's sleep. Enjoy modern amenities such as a flat-screen TV, complimentary Wi-Fi, and a well-appointed work desk. The soothing color palette and tasteful decor create a tranquil atmosphere for your stay.",
      '+92 321 5439876'),
  users(
      'images/j1.jpeg',
      'images/j2.jpeg',
      'super Deluxe Room',
      "Provides additional space and amenities to standard rooms.",
      '€89',
      'Tokyo,Japan',
      "Indulge in luxury with our Deluxe Suite, offering a spacious and elegantly designed living space. The suite includes a plush king-sized bed, a separate living area with a stylish sofa and coffee table, and a private balcony with scenic views. Pamper yourself in the well-appointed bathroom with a deep soaking tub and premium toiletries. Complimentary access to our exclusive lounge adds an extra touch of refinement to your experience.",
      '+92 343 9876521'),
  users(
      'images/k1.jpeg',
      'images/k2.jpeg',
      'luxury suite',
      "Offers top-tier amenities, multiple bedrooms, and premium furnishings.",
      '€49',
      'Paris,France',
      "Step into opulence with our Presidential Suite, a luxurious retreat for the discerning traveler. This expansive suite boasts a master bedroom with a king-sized bed, a separate living and dining area, a private kitchenette, and a fully equipped office space. The suite is adorned with upscale furnishings, fine art, and panoramic windows offering breathtaking views. Enjoy personalized concierge service, complimentary airport transfers, and access to our exclusive amenities.",
      '+92 321 9854376'),
];
