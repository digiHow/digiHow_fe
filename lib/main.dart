import 'package:digi_how/consts/colors.dart';
import 'package:digi_how/consts/input_decoration.dart';
import 'package:digi_how/firebase_options.dart';
import 'package:digi_how/screens/matching/matching_complete.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'digiHow',
      theme: ThemeData(
        fontFamily: 'NotoSansKR',
        inputDecorationTheme: MyInputDecorationTheme.greyTextField,
        scaffoldBackgroundColor: MyColors.white,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: MyColors.primary),
          shadowColor: Colors.transparent,
          color: Colors.transparent,
        ),
      ),
      home: const SafeArea(
        child: Scaffold(
          backgroundColor: MyColors.white,
          body: MatchingComplete(),
        ),
      ),
    );
  }
}
