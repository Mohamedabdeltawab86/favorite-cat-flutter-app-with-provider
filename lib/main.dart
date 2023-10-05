import 'package:flutter/material.dart';
import 'package:like_cat/provider/cat_provider.dart';
import 'package:provider/provider.dart';
import 'screens/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CatProvider(),
    child: const MyApp()));
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
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

