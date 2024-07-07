import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class YourDataModel {
  final String pic1;
  final String title;

  YourDataModel({required this.pic1, required this.title});

  factory YourDataModel.fromJson(Map<String, dynamic> json) {
    return YourDataModel(
      pic1: json['pic1'],
      title: json['price'],
    );
  }
}

class DataDisplayWidget extends StatefulWidget {
  @override
  _DataDisplayWidgetState createState() => _DataDisplayWidgetState();
}

class _DataDisplayWidgetState extends State<DataDisplayWidget> {
  late Future<List<YourDataModel>> futureData;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
    _controller = PageController();
  }

  Future<List<YourDataModel>> fetchData() async {
    final response = await http.get(Uri.parse('http://192.168.0.101:3000'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => YourDataModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Display'),
      ),
      body: FutureBuilder<List<YourDataModel>>(
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
                  child: Container(
                    margin: EdgeInsets.all(15),
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 8,
                          spreadRadius: 8,
                          color: Colors.black12,
                        )
                      ],
                      border: Border.all(width: 5, color: Colors.white),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 330,
                                  width: 350,
                                  child: PageView(
                                    controller: _controller,
                                    children: [
                                      Container(
                                        height: 300,
                                        width: 300,
                                        margin: EdgeInsets.only(
                                          top: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                            image: AssetImage(data.pic1),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 300,
                                        width: 300,
                                        margin: EdgeInsets.only(
                                          top: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Text(data.title),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 0,
                                ),
                                // Assuming you have a unique indicator for each item
                                SmoothPageIndicator(
                                  axisDirection: Axis.horizontal,
                                  controller: _controller,
                                  count: 2,
                                  effect: const JumpingDotEffect(
                                    dotHeight: 10,
                                    dotWidth: 10,
                                    verticalOffset: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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

void main() {
  runApp(MaterialApp(
    home: DataDisplayWidget(),
  ));
}
