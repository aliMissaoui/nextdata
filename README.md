# NextData

A Flutter/Android application that leverages Firebase for backend services and implements features like authentication, browsing posts, detailed post views, and real-time search functionality.

## Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Running the Project](#running-the-project)
- [Project Structure](#project-structure)
- [Project Demo - Video](#project-demo)


## Features

- **Home Screen**: Displays a list of posts fetched from a backend service.
- **Post Details Screen**: Shows detailed information about a post.
- **Real-Time Search**: Filters posts based on keywords typed in the search bar.
- **Custom Drawer**: Provides navigation options.
- **Bottom Navigation Bar**: Allows switching between different pages.
- **Firebase Integration**: Utilizes Firebase for backend services.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- **Flutter**: Make sure Flutter is installed on your machine. You can follow the official [Flutter installation guide](https://flutter.dev/docs/get-started/install) to set it up.
- ***Flutter env version***:
Flutter 3.19.3 • channel stable
-- Tools • Dart 3.3.1 • DevTools 2.31.1
- **Dart**: Dart should be installed as it is required by Flutter.
- **Firebase Project**: Set up a Firebase project to obtain your configuration keys or use the .env file sent to you by email (place it in the root of the project).

## Installation

1. **Clone the repository**:

    ```bash
    git clone git@github.com:aliMissaoui/nextdata.git
    cd nextdata
    ```

2. **Install dependencies**:

    ```bash
    flutter pub get
    ```

## Configuration

1. **Firebase Configuration**: Add your Firebase configuration values to a `.env` file (or use the existing .env file sent to you by email).

    Create a `.env` file in the root of your project and add the following:

    ```env
    FIREBASE_API_KEY=your_api_key
    FIREBASE_APP_ID=your_app_id
    FIREBASE_MESSAGING_SENDER_ID=your_messaging_sender_id
    FIREBASE_PROJECT_ID=your_project_id
    ```

2. **Ensure `.env` is ignored by version control**:

    Add the following line to your `.gitignore`:

    ```plaintext
    .env
    ```

## Running the Project

1. **Load the environment variables and initialize Firebase**:

    Modify your `main.dart` to load environment variables and initialize Firebase (ignore this step if you have placed the .env file sent to you by email):

    ```dart
    import 'package:flutter/material.dart';
    import 'package:flutter_dotenv/flutter_dotenv.dart';
    import 'package:firebase_core/firebase_core.dart';

    void main() async {
      await dotenv.load(fileName: ".env");

      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: FirebaseOptions(
          apiKey: dotenv.env['FIREBASE_API_KEY']!,
          appId: dotenv.env['FIREBASE_APP_ID']!,
          messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!,
          projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
        ),
      );
    // ...
    ```

2. **Run the application**:

    ```bash
    flutter run --release
    ```

## Project Structure

Here is an overview of the project's directory structure:

lib/
├── config/
│ ├── theme/
│ └── utils/
├── features/
│ ├── home/
│ │ ├── presentation/
│ │ │ ├── bloc/
│ │ │ ├── pages/
│ │ │ └── widgets/
│ └── posts/
│ ├── domain/
│ │ └── entities/
│ ├── presentation/
│ │ ├── bloc/
│ │ ├── pages/
│ │ └── widgets/
└── main.dart

## Project Demo
Due to GitHub 10MB limit video size, the following video is a low quality demo, for a higher and better quality demo check this link: https://drive.google.com/drive/folders/19P7h3fcG7ESnLZUseuOjw5K47STfFNdX?usp=sharing

https://github.com/user-attachments/assets/03b1be71-594c-4e11-9d9c-a4edabc23fb7



