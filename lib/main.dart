import 'package:flutter/material.dart';
import 'package:your_alias/core/theme.dart';
import 'package:your_alias/presentation/onboarding/onboarding.dart';
void main() {
   WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your Alias',
      theme: AppTheme.lightTheme,
      
      home: OnboardingScreen (),
    );
  }
}




