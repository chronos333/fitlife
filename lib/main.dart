import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Providers/app_state.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => AppState(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appState.isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: const SplashScreen(),
    );
  }
}
