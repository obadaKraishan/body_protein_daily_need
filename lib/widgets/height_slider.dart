import 'package:flutter/material.dart';

// Widget to select height using a slider
class HeightSlider extends StatelessWidget {
  final double height; // Current height value
  final Function(double) onHeightChanged; // Callback function to handle height changes

  // Constructor to initialize the HeightSlider with height and onHeightChanged callback
  HeightSlider({required this.height, required this.onHeightChanged});

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
              'HEIGHT', // Label for the slider
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            SizedBox(height: 10.0), // Space between the label and value
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                // Display the current height value
                Text(
                  height.toStringAsFixed(1),
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900, color: Colors.white),
                ),
                // Display the unit (cm)
                Text(
                  ' cm',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ],
            ),
            // Slider to select the height
            Slider(
              value: height, // Current height value
              min: 100, // Minimum height
              max: 250, // Maximum height
              onChanged: onHeightChanged, // Callback when the slider value changes
            ),
          ],
        ),
      ),
    );
  }
}
