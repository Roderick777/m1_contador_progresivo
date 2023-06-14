import 'package:flutter/material.dart';
import 'package:m1_contador_progresivo/pages/home.page.dart';
import 'package:m1_contador_progresivo/providers/color.provider.dart';
import 'package:m1_contador_progresivo/providers/config.provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ColorProvider()),
        ChangeNotifierProvider(create: (_) => ConfigProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodySmall: TextStyle(
            fontFamily: 'Roboto',
          ),
        ),
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
