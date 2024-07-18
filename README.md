
# Body Protein Daily Need App

A Flutter application to calculate the daily protein needs based on the user's gender, height, weight, and age.

## 🌟 Features
- User-friendly interface to input gender, height, weight, and age.
- Real-time calculation of daily protein needs.
- Results displayed with detailed information and the option to save the result as an image.
- Responsive design for various devices.
- Dark theme with a clean and modern look.

## 📱 Screens
### Home Screen
- **Gender Selection**: Allows users to select their gender (Male/Female).
- **Height Slider**: A slider to select the user's height in centimeters.
- **Weight and Age Selection**: Increment and decrement buttons to select the user's weight in kilograms and age in years.
- **Calculate Button**: Calculates the daily protein need based on the user's input and navigates to the result screen.

### Result Screen
- Displays a summary of the user's input.
- Shows the calculated daily protein need in grams.
- Detailed calculation explanation.
- Option to re-calculate or save the result as an image.

## 🛠️ Technologies Used
- **Frontend**: Flutter, Dart
- **State Management**: Stateful Widgets
- **Plugins**: `screenshot`, `path_provider`

## 📝 Setup Instructions
Follow these steps to set up the project locally:

### 1. Clone the Repository
```bash
git clone https://github.com/obadaKraishan/body_protein_daily_need.git
cd body_protein_daily_need
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Run the Application
```bash
flutter run
```

## 📄 Project Structure
```plaintext
lib/
├── main.dart
├── screens/
│   ├── home_screen.dart
│   └── result_screen.dart
├── widgets/
│   ├── gender_selector.dart
│   ├── height_slider.dart
│   └── weight_age_selector.dart
└── models/
    └── user_data.dart
```

## 🎨 Customization
### 1. Update Theme
Modify the theme settings in `main.dart` to customize the app's look and feel.

### 2. Update Text and Labels
Adjust the text and labels in the respective widgets to personalize the user experience.

### 3. Update Calculation Logic
Enhance the calculation logic in `user_data.dart` to include more factors if needed.

## 📄 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Contributors
- [Obada Kraishan](https://github.com/obadaKraishan)

![Home Screen](screenshots/home_screen.png)

### Result Screen
![Result Screen](screenshots/result_screen.png)
