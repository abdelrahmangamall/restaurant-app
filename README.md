# 🍽️ Restaurant Mobile App

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-039BE5?style=for-the-badge&logo=Firebase&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=Dart&logoColor=white)

A complete restaurant mobile application built with Flutter and Firebase that provides food ordering functionality.

## ✨ Features

- 🔐 **Authentication System**
  - Email/password login/signup
  - Firebase Authentication
  - Form validation

- 🍔 **Menu System**
  - Browse food items with images
  - Real-time updates from Firestore
  - Detailed item descriptions

- 🛒 **Shopping Cart**
  - Add/remove items
  - Quantity adjustment
  - Real-time total calculation

## 📸 Screenshots

| Login Screen | Menu Screen | Cart Screen |
|--------------|-------------|-------------|
| <img src="screenshots/login.jpg" width="200"> | <img src="screenshots/menu.jpg" width="200"> | <img src="screenshots/cart.jpg" width="200"> |

## 🛠 Tech Stack

- **Frontend**: Flutter (Dart)
- **Backend Services**:
  - Firebase Authentication
  - Cloud Firestore
- **State Management**: Provider
- **Additional Packages**:
  - Cached Network Image
  - Google Fonts
  - Fluttertoast

## 📂 Project Structure

```plaintext
lib/
├── main.dart
├── models/
│   ├── menu_item.dart
│   └── user_model.dart
├── providers/
│   ├── auth_provider.dart
│   └── cart_provider.dart
├── screens/
│   ├── auth_screen.dart
│   ├── cart_screen.dart
│   ├── menu_screen.dart
│   └── splash_screen.dart
├── services/
│   ├── auth_service.dart
│   └── database_service.dart
├── utils/
│   ├── constants.dart
│   └── helpers.dart
└── widgets/
    ├── custom_button.dart
    ├── custom_textfield.dart
    └── menu_item_card.dart
