import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

// ResultScreen widget to display the calculated protein needs and other details
class ResultScreen extends StatelessWidget {
  final double proteinNeed; // Daily protein need calculated
  final String gender; // User's gender
  final double height; // User's height
  final int weight; // User's weight
  final int age; // User's age

  // Constructor to initialize the ResultScreen with the necessary parameters
  ResultScreen({
    required this.proteinNeed,
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
  });

  // Controller to handle screenshot capturing
  final ScreenshotController screenshotController = ScreenshotController();

  // Function to save the screenshot to the device's storage
  Future<void> _saveScreenshot(BuildContext context) async {
    // Get the application documents directory
    final directory = await getApplicationDocumentsDirectory();
    // Capture and save the screenshot to the specified directory with a file name
    final imagePath = await screenshotController.captureAndSave(
      directory.path,
      fileName: 'protein_need_result.png',
    );
    // If the image path is not null, show a SnackBar with the saved image path
    if (imagePath != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Results saved to $imagePath')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Daily Protein Need'), // AppBar title
      ),
      body: Screenshot(
        controller: screenshotController, // Assign the screenshot controller
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Summary of your entries:',
                  style: TextStyle(fontSize: 20, color: Colors.white), // Summary title
                ),
                SizedBox(height: 10),
                Text(
                  'Gender: $gender',
                  style: TextStyle(fontSize: 18, color: Colors.white), // Display gender
                ),
                Text(
                  'Height: ${height.toStringAsFixed(1)} cm',
                  style: TextStyle(fontSize: 18, color: Colors.white), // Display height
                ),
                Text(
                  'Weight: $weight kg',
                  style: TextStyle(fontSize: 18, color: Colors.white), // Display weight
                ),
                Text(
                  'Age: $age years',
                  style: TextStyle(fontSize: 18, color: Colors.white), // Display age
                ),
                SizedBox(height: 20),
                Text(
                  'Your daily protein need is:',
                  style: TextStyle(fontSize: 24, color: Colors.white), // Protein need title
                ),
                SizedBox(height: 20),
                Text(
                  '${proteinNeed.toStringAsFixed(1)} grams',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white), // Display protein need
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Calculation Details:',
                  style: TextStyle(fontSize: 20, color: Colors.white), // Calculation details title
                ),
                SizedBox(height: 10),
                Text(
                  'Protein need = ${gender == 'male' ? '0.8' : '0.6'} grams per kg of body weight',
                  style: TextStyle(fontSize: 18, color: Colors.white), // Protein need formula
                ),
                Text(
                  'Total protein need = ${gender == 'male' ? '0.8' : '0.6'} x $weight',
                  style: TextStyle(fontSize: 18, color: Colors.white), // Total protein need calculation
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Navigate back to the previous screen
                  },
                  child: Text(
                      'RE-CALCULATE',
                      style: TextStyle(
                          color: Color(0xFF344e41) // Button text color
                      )
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => _saveScreenshot(context), // Call the save screenshot function
                  child: Text(
                      'SAVE RESULTS AS IMAGE',
                      style: TextStyle(
                          color: Color(0xFF344e41) // Button text color
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
