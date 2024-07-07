import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectry/home.dart';
import 'package:projectry/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              brightness: Brightness.light,
              colorScheme: const ColorScheme.light(
                  primary: Color.fromARGB(255, 0, 179, 255),
                  onPrimary: Colors.white,
                  background: Colors.white),
              textTheme: const TextTheme(
                  displayMedium:
                      TextStyle(color: Color.fromARGB(255, 0, 179, 255)),
                  bodyMedium:
                      TextStyle(color: Color.fromARGB(255, 0, 179, 255)),
                  bodyLarge:
                      TextStyle(color: Color.fromARGB(255, 0, 179, 255)))),
          darkTheme: ThemeData(
              brightness: Brightness.dark,
              colorScheme: const ColorScheme.dark(
                  primary: Color.fromARGB(255, 0, 179, 255),
                  background: Colors.black)),
          home: const mainscreen()),
    );
  }
}

// ignore: camel_case_types
class mainscreen extends StatelessWidget {
  const mainscreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/piclogo.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          margin: EdgeInsets.only(top: 250.h),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: const inputbox(),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class inputbox extends StatelessWidget {
  const inputbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 360.w,
        height: 440.h,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(40),
              child: Text(
                "LOGIN",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: const Color.fromARGB(255, 0, 179, 255),
                    fontSize: 24),
              ),
            ),
            Container(
                width: 250.w,
                padding: EdgeInsets.only(bottom: 0.w),
                child: Column(
                  children: [
                    TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: "EMAIL",
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color: Color.fromARGB(255, 0, 179, 255)),
                        )),
                    Container(
                      height: 1.h,
                      color: Color.fromARGB(255, 0, 179, 255),
                    )
                  ],
                )),
            Container(
              width: 250.w,
              padding: EdgeInsets.only(bottom: 0.w),
              child: Column(
                children: [
                  TextField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: "PASSWORD",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Color.fromARGB(255, 0, 179, 255)),
                      )),
                  Container(
                    height: 1.h,
                    color: const Color.fromARGB(255, 0, 179, 255),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 120.w),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot My Password",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Color.fromARGB(255, 0, 179, 255)),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.h),
              child: Column(children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => topbar()));
                  },
                  style: TextButton.styleFrom(
                      fixedSize: Size(250.w, 20.h),
                      backgroundColor: Theme.of(context).colorScheme.primary),
                  child: Text("LOGIN",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white)),
                ),
                Container(
                    margin: EdgeInsets.only(left: 90.w, top: 0.h),
                    child: Row(
                      children: [
                        Text(
                          "Don't have an Account?",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.grey),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const signupinput())));
                            },
                            child: Text(
                              "Signup",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                            ))
                      ],
                    ))
              ]),
            )
          ],
        ),
      ),
    );
  }
}
