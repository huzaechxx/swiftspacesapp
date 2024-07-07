import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Colors.deepPurple,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 0, 179, 255),
          flexibleSpace: Container(
            decoration: const BoxDecoration(),
            child: Row(
              children: [
                Positioned(
                  child: GestureDetector(
                    onTap: () {
                      print('object\n');
                    },
                    child: Container(
                      width: 300,
                      height: 50,
                      margin: const EdgeInsets.only(top: 50, left: 10),
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 8,
                                spreadRadius: 8,
                                color: Colors.black12)
                          ],
                          color: Colors.white,
                          border: Border.all(width: 3, color: Colors.black),
                          borderRadius: BorderRadius.circular(30)),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\t  Where To?',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\t  Anywhere - Any Week - Add Guests',
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: Positioned(
                      child: IconButton(
                    onPressed: () {},
                    color: Colors.white,
                    icon: const Icon(Icons.tune),
                  )),
                )
              ],
            ),
          ),
          bottom: TabBar(tabs: [
            Tab(
                child: Row(
              children: [
                IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {},
                  icon: Icon(Icons.home),
                  color: Colors.white,
                ),
                const Text(
                  'home',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            )),
            Tab(
                child: Row(
              children: [
                IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {},
                  icon: Icon(Icons.home),
                  color: Colors.white,
                ),
                const Text(
                  'home',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            )),
            Tab(
                child: Row(
              children: [
                IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {},
                  icon: Icon(Icons.home),
                  color: Colors.white,
                ),
                const Text(
                  'home',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            )),
          ]),
        ),
        body: TabBarView(children: [
          Container(
            color: Colors.amber,
          ),
          Container(
            color: Colors.purple,
          ),
          Container(
            color: Colors.blue,
          ),
        ]),
      ),
    );
  }
}
