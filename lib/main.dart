import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rock_paper/api_service.dart';
import 'package:rock_paper/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: ChangeNotifierProvider<ApiService>(
        create: (_) => ApiService(),
        child: const HomePage(),
      ),
      //  Provider<ApiService>(
      //   create: ((context) => ApiService()),
      //   child: const HomePage(),
      // ),
    );
  }
}
