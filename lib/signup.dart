import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectry/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) => MaterialApp(
          theme: ThemeData(
            textTheme: const TextTheme(
                bodySmall: TextStyle(color: Colors.black),
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
              displayMedium: TextStyle(color: Color.fromARGB(255, 0, 179, 255)),
              bodyLarge: TextStyle(
                  color: Color.fromARGB(255, 0, 179, 255), fontSize: 40),
            ),
            brightness: Brightness.dark,
            colorScheme: const ColorScheme.dark(
              background: Color.fromARGB(255, 50, 50, 50),
              primary: Color.fromARGB(255, 0, 179, 255),
            ),
          ),
          home: const signupinput()),
    );
  }
}

// ignore: camel_case_types
class signupinput extends StatelessWidget {
  const signupinput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          image: const DecorationImage(
              image: AssetImage('images/piclogo.png'), fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            padding: EdgeInsets.only(top: 250.h),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: SingleChildScrollView(
                child: Container(
                  width: 360.w,
                  height: 440.h,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        "SIGNUP",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: Color.fromARGB(255, 0, 179, 255)),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                                width: 250.w,
                                height: 50.h,
                                child: Column(
                                  children: [
                                    TextField(
                                      decoration: InputDecoration(
                                          hintText: "NAME",
                                          hintStyle: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  color: const Color.fromARGB(
                                                      255, 0, 179, 255))),
                                    ),
                                    Container(
                                      height: 1.h,
                                      color: Color.fromARGB(255, 0, 179, 255),
                                    )
                                  ],
                                )),
                            Container(
                                width: 250.w,
                                height: 50.h,
                                child: Column(
                                  children: [
                                    TextField(
                                      decoration: InputDecoration(
                                          hintText: "EMAIL",
                                          hintStyle: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  color: const Color.fromARGB(
                                                      255, 0, 179, 255))),
                                    ),
                                    Container(
                                      height: 1.h,
                                      color: Color.fromARGB(255, 0, 179, 255),
                                    )
                                  ],
                                )),
                            Container(
                                width: 250.w,
                                height: 50.h,
                                child: Column(
                                  children: [
                                    TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          hintText: "PASSWORD",
                                          hintStyle: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  color: const Color.fromARGB(
                                                      255, 0, 179, 255))),
                                    ),
                                    Container(
                                      height: 1.h,
                                      color: Color.fromARGB(255, 0, 179, 255),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Center(
                          child: Container(
                        margin: EdgeInsets.only(top: 30.h),
                        width: 300,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(30)),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => mainscreen()));
                            },
                            child: const Text(
                              "signup",
                              style: TextStyle(color: Colors.white),
                            )),
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an Account?",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.grey),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("login"))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
