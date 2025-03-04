# Image Post App

## Overview
The **Image Post App** is a Flutter application that allows users to select images, apply filters, and post them in a social media-style UI. It utilizes **image_picker** for image selection and **carousel_slider** for displaying multiple images.

## Features
- Select multiple images from the gallery.
- Apply various filters to the selected images.
- View the filtered images in a carousel-style post.
- Navigate between screens using a structured flow.

## Folder Structure
```
image_post_app/
│-- lib/
│   ├── main.dart
│   ├── screens/
│   │   ├── start_screen.dart
│   │   ├── new_post_screen.dart
│   │   ├── filter_screen.dart
│   │   ├── home_screen.dart
│   ├── widgets/
│   │   ├── filter_selector.dart
│   ├── utils/
│   │   ├── filter_utils.dart
│-- pubspec.yaml
```

## Installation
1. **Clone the repository:**
   ```sh
   git clone https://github.com/yourusername/image-post-app.git
   ```
2. **Navigate to the project directory:**
   ```sh
   cd image-post-app
   ```
3. **Install dependencies:**
   ```sh
   flutter pub get
   ```
4. **Run the app:**
   ```sh
   flutter run
   ```

## Dependencies
Make sure to add the following dependencies in `pubspec.yaml`:
```yaml
dependencies:
  flutter:
    sdk: flutter
  image_picker: ^1.0.7
  carousel_slider: ^4.2.1
```

## Screens
### 1. Start Screen
- Displays a button to navigate to the New Post screen.

### 2. New Post Screen
- Allows users to pick multiple images from the gallery.
- Displays selected images in a horizontal list.
- Navigates to the **Filter Screen**.

### 3. Filter Screen
- Shows selected images with applied filters.
- Provides a **FilterSelector** widget to choose filters.
- Navigates to the **Home Screen**.

### 4. Home Screen
- Displays a **carousel slider** with the final filtered images.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

