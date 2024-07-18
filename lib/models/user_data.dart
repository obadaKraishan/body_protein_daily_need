// UserData class to store user details and calculate daily protein needs
class UserData {
  String? gender; // User's gender
  double? height; // User's height
  int? weight; // User's weight
  int? age; // User's age

  // Constructor to initialize the UserData with optional parameters
  UserData({ this.gender, this.height, this.weight, this.age});

  // Method to calculate the daily protein need based on weight and gender
  double calculateProteinNeed() {
    // Protein requirement per kg based on gender
    double proteinPerKg = gender == 'male' ? 1.2 : 1.0;
    // Calculate and return the total protein need
    return weight! * proteinPerKg;
  }
}
