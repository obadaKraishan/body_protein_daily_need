import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'package:path_provider/path_provider.dart';

// Main function to initialize the app and run it
void main() async {
  // Ensure that plugin services are initialized so that the app can use them
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BodyProteinApp());
}

// Root widget of the application
class BodyProteinApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner from the app
      debugShowCheckedModeBanner: false,
      title: 'Body Protein Daily Need',
      // Apply a dark theme to the app with custom colors
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF344e41), // Primary color for the app
        scaffoldBackgroundColor: Color(0xFF344e41), // Background color for scaffold
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF344e41), // Background color for app bars
        ),
        sliderTheme: SliderTheme.of(context).copyWith(
          activeTrackColor: Color(0xFFdad7cd), // Color of the active track
          thumbColor: Color(0xFF344e41), // Color of the thumb
          overlayColor: Color(0x29a3b18a), // Color of the overlay
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0), // Shape of the thumb
          overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0), // Shape of the overlay
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white), // Text color
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFdad7cd), // Button background color
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20), // Button padding
          ),
        ),
      ),
      home: HomeScreen(), // Set the home screen of the app
    );
  }
}
