import 'package:flutter/material.dart';
import 'result_screen.dart';
import '../widgets/gender_selector.dart';
import '../widgets/height_slider.dart';
import '../widgets/weight_age_selector.dart';

// HomeScreen widget that allows the user to input their details
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// State class for HomeScreen
class _HomeScreenState extends State<HomeScreen> {
  String? _gender; // Variable to store selected gender
  double _height = 170; // Variable to store height with a default value
  int _weight = 60; // Variable to store weight with a default value
  int _age = 25; // Variable to store age with a default value

  // Function to set the gender
  void _setGender(String gender) {
    setState(() {
      _gender = gender;
    });
  }

  // Function to set the height
  void _setHeight(double height) {
    setState(() {
      _height = height;
    });
  }

  // Function to set the weight
  void _setWeight(int weight) {
    setState(() {
      _weight = weight;
    });
  }

  // Function to set the age
  void _setAge(int age) {
    setState(() {
      _age = age;
    });
  }

  // Function to calculate the daily protein need and navigate to the result screen
  void _calculateProteinNeed() {
    if (_gender != null) {
      // Calculate protein need based on gender and weight
      double proteinNeed = (_gender == 'male' ? 0.8 : 0.6) * _weight;
      // Navigate to ResultScreen with the calculated protein need and user details
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            proteinNeed: proteinNeed,
            gender: _gender!,
            height: _height,
            weight: _weight,
            age: _age,
          ),
        ),
      );
    } else {
      // Show a SnackBar if gender is not selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select gender')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Body Protein Daily Need'), // AppBar title
        centerTitle: true, // Center the title
      ),
      body: Column(
        children: [
          // Expanded row for selecting gender
          Expanded(
            child: Row(
              children: [
                // Gender selector for male
                GenderSelector(
                  gender: 'male',
                  selectedGender: _gender,
                  onGenderSelected: _setGender,
                ),
                // Gender selector for female
                GenderSelector(
                  gender: 'female',
                  selectedGender: _gender,
                  onGenderSelected: _setGender,
                ),
              ],
            ),
          ),
          // Expanded widget for height slider
          Expanded(
            child: HeightSlider(
              height: _height,
              onHeightChanged: _setHeight,
            ),
          ),
          // Expanded row for selecting weight and age
          Expanded(
            child: Row(
              children: [
                // Weight selector
                WeightAgeSelector(
                  label: 'WEIGHT',
                  value: _weight,
                  onChanged: _setWeight,
                ),
                // Age selector
                WeightAgeSelector(
                  label: 'AGE',
                  value: _age,
                  onChanged: _setAge,
                ),
              ],
            ),
          ),
          // Container for the calculate button
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: _calculateProteinNeed, // Call the function to calculate protein need
              child: Text(
                'CALCULATE',
                style: TextStyle(
                    color: Color(0xFF344e41) // Button text color
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
