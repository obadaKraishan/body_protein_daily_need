import 'package:flutter/material.dart';

// Widget to select weight or age with increment and decrement buttons
class WeightAgeSelector extends StatelessWidget {
  final String label; // Label for the selector (e.g., "WEIGHT" or "AGE")
  final int value; // Current value of the selector
  final Function(int) onChanged; // Callback function to handle value changes

  // Constructor to initialize the selector with label, value, and onChanged callback
  WeightAgeSelector({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5.0), // Margin around the container
        padding: EdgeInsets.all(10.0), // Padding inside the container
        decoration: BoxDecoration(
          color: Color(0xFF588157), // Background color of the container
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label, // Display the label
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            SizedBox(height: 10.0), // Space between the label and value
            Text(
              value.toString(), // Display the current value
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900, color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Button to decrement the value
                RoundIconButton(
                  icon: Icons.remove,
                  onPressed: () => onChanged(value - 1),
                ),
                SizedBox(width: 10.0), // Space between the buttons
                // Button to increment the value
                RoundIconButton(
                  icon: Icons.add,
                  onPressed: () => onChanged(value + 1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Widget for a round icon button used to increment or decrement values
class RoundIconButton extends StatelessWidget {
  final IconData icon; // Icon to display inside the button
  final VoidCallback onPressed; // Callback function when the button is pressed

  // Constructor to initialize the button with an icon and onPressed callback
  RoundIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon), // Display the icon
      onPressed: onPressed, // Handle button press
      elevation: 6.0, // Elevation for shadow effect
      constraints: BoxConstraints.tightFor(
        width: 36.0, // Button width
        height: 36.0, // Button height
      ),
      shape: CircleBorder(), // Circle shape
      fillColor: Color(0xFF344e41), // Background color of the button
    );
  }
}
