import 'package:flutter/material.dart';
import 'package:portofolio/views/allmenu.dart';
import 'package:portofolio/views/halamanapertama.dart';
import 'package:portofolio/views/halamandatapersonal.dart';
import 'package:portofolio/views/halamaneditdata.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:portofolio/views/loginview/login.dart';
import 'package:portofolio/views/loginview/terimadata.dart';
import 'package:portofolio/views/cuti/calendar.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: const HalamanPertama(),
        home: const AllMenu(),
        routes: {
          '/view/halamanpertama': (context) => const HalamanPertama(),
          '/view/halamandatapersonal': (context) => const HalamandataPersonal(),
          '/view/halamaneditdata': (context) => const HalamanEditData(),
          '/view/allmenu': (context) => const AllMenu(),
          '/view/loginview/login': (context) => const Login(),
          '/view/loginview/terimadata': (context) => const TerimaData(),
          '/view/cuti/calendar': (context) => const Calendar(),
        });
  }
}
