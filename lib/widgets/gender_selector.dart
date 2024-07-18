import 'package:flutter/material.dart';

class GenderSelector extends StatelessWidget {
  final String gender;
  final String? selectedGender;
  final Function(String) onGenderSelected;

  GenderSelector({required this.gender, required this.selectedGender, required this.onGenderSelected});

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedGender == gender;

    return Expanded(
      child: GestureDetector(
        onTap: () => onGenderSelected(gender),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? (gender == 'male' ? Color(0xFF3a5a40) : Color(0xFF3a5a40)) : Color(0xFF588157),
            borderRadius: BorderRadius.circular(10.0),
          ),
          margin: EdgeInsets.all(5.0),
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                gender == 'male' ? Icons.male : Icons.female,
                size: 60.0,
                color: Colors.white,
              ),
              SizedBox(height: 15.0),
              Text(
                gender.toUpperCase(),
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
