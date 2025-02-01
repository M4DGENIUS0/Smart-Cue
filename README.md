
<!-- PROJECT LOGO -->
<br />
<div align="center">
  <img src="https://github.com/M4DGENIUS0/Smart-Cue/blob/master/android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png?raw=true" alt="Logo" style="width:200px;height:200px;">

  <h2 align="center">Smart Cue</h2>

  <p align="center">
     Your AI-powered teleprompter app that generates dynamic prompts for seamless speech delivery.
    <br />
<!--     <a href="https://github.com/M4DGENIUS0/Smart-Cue/"><strong>Explore the docs »</strong></a> -->
    <br />
    <br />
    <a href="">View Demo</a>
    ·
    <a href="">Privacy & Policies</a>
    ·
    <a href="">Request Feature</a>
  </p>
</div>




## ❓ About

Smart Cue is an AI-powered teleprompting app that helps you create and display scripts with ease. Generate teleprompts from smart suggestions or write your own for smooth and professional presentations. Perfect for speeches, videos, and live broadcasts!

## 💪 Features

Some of the features Mandarin provides are:

- 🔮 **AI-Generated Teleprompts** : **Added ✅** : Generate teleprompts using AI suggestions.
- 📱 **Manual Teleprompt Creation** : **Added ✅** : Create your own teleprompts from scratch.
- 🤗 **Edit & Save Teleprompts** : **Added ✅** : Modify and store your teleprompts for later use.
- 📝 **Editable Create Screen	** : **Added ✅** : Enable users to modify UI settings while creating scripts.
- ♟ **User-Generated Suggestions** : **Upcoming 🔄** : Allow users to contribute and refine AI suggestions.
- ⚙ **Customization Settings** : **Upcoming 🔄** : Add options to customize fonts, colors, and backgrounds.

## 📸 Android Gifs

  Ai Generated             |      TelePrompt           |    Manually Created
:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/M4DGENIUS0/Smart-Cue/blob/master/assets/tutorial/Ai.gif?raw=true)|![](https://github.com/M4DGENIUS0/Smart-Cue/blob/master/assets/tutorial/Teleprompt.gif?raw=true)|![](https://github.com/M4DGENIUS0/Smart-Cue/blob/master/assets/tutorial/Manual.gif?raw=true)

## Diagram 
  App Flow Chart               
:-------------------------:
![](https://github.com/M4DGENIUS0/Smart-Cue/blob/master/assets/flowchart/flowchart.png?raw=true)|



<!-- GETTING STARTED -->
## 💻 Requirements

- Any Operating System (ie. MacOS X, Linux, Windows)
- Any IDE with Flutter SDK installed (ie. IntelliJ, Android Studio, VSCode etc)
- A little knowledge of Dart and Flutter

## Installation Guide

Before beginning with the installation, you will need the following with the mentioned versions

- Android Studio Version - Ladybug | 2024.2.1
- Flutter Version - 3.24.2
- Dart - 3.7.0
- Xcode - 16.0
- VS Code - 1.95



## Installation

> NOTE: It is recommended that you run a simple Hello World program in Flutter first before proceeding further so that you are sure that the environment is properly set up.

### API Key

Make sure your API must be working properly and active.
- Get a API Key from [here](https://ai.google.dev/).


## Clone the repository

- Open your terminal or command prompt or Windows PowerShell
- Navigate to the directory where you want to save the project
- Use the git clone command followed by the repository URL

```sh
git clone https://github.com/M4DGENIUS0/Smart-Cue.git
```

## Configure API

- Enter your API key.
```
lib/
  │── services/
  |     └── GemeniService.dart
  └── main.dart
```
- Enter your API key at Line 07, Col 18
```dart
String APIKey = 'Your-API-Key';
```

## Install dependencies

- Navigate to the project's directory

```sh
cd <repository-name>
```

- Run the following command to install the required packages

```sh
flutter pub get
```

### Connect a device or emulator

* Physical Device

  1. Enable USB debugging on your device
  2. Connect it to your computer using a USB cable.

* Emulator

  1. Start an Android or iOS emulator using your preferred IDE or tools.

### Run the Project

- Use the following command to build and run the project

- Use it for Testing.
```sh
flutter run
```
<p align="center">OR</p>

- Use it to Official Release the APK

```sh
flutter build apk --release
```
- Flutter will automatically Build and Release, store it into `(Project-Name)/build/app/outputs/flutter-apk/app-release.apk` change Apk name. Enjoy! 


## Minimum Versions

- Android: 06
  
## Maximum Versions

- Android: 18

## API Documentation

For the API Documentation, please go through - [Link](not yet)

## 🔽 Download

You can download the APP at [Mandarin App](https://drive.google.com/file/d/1wItp35WbRITIzUVU9NFWrXjEDdeSBs6s/view?usp=drive_link) 

## Directory Structure
```
lib
│── models/
|       ├── script_model.dart
|       └── script_model.g.dart           
│── views/
|       ├── Add_Script/
|       ├── Home/
|       ├── Init_Home/
|       ├── Setting/
|       ├── Theme/
|       |     └── Theme.dart
|       └── views.dart    
│── controllers/
|       ├── prompt/
|       |     └── script_generation.dart
|       └── script_repo/
|             ├── hive_repository.dart
|             └── hive_script_repo.dart
│── services/
|       ├── GemeniService.dart
|       └── hive_services.dart        
│── utils/
|       ├── Status/
|       |     ├── ExportFormat.dart
|       |     └── GenerationStatus.dart  
|       └── assets.dart             
│── config/
|      ├── color/
|      |     └── colors.dart
|      ├── component/
|      |      ├── generate_by_ai_components/
|      |      |          └── BottomSheet_Components.dart
|      |      ├── Nav_Bar_Component/
|      |      |          └── Nav_Bar_Comp.dart
|      |      ├── popup_button_text_sizes/
|      |      |          └── text_sizes.dart
|      |      ├── TabBar_Component/
|      |      |          └── Tab_Bar_Component.dart
|      |      └──component.dart
|      └── demo/
|           └── colors.dart        
│── exceptions/
|           └── network_exception.dart     
│── extensions/
|      ├── dialog_box/
|      |      └── custom_dialog_box.dart
|      ├── flush_bar/
|      |      └── Error_FlushBar.dart
|      ├── popup_card/
|      |      └── add_script_pop_up_card.dart
|      └── extentions.dart      
│── routes/
|      └── route.dart           
│── animations/
|       └── hero_transition.dart      
└── main.dart 

```


<!-- LICENSE -->
## 🔖 LICENCE

Distributed under the MIT License. See `LICENSE.txt` for more information.



<!-- CONTACT -->
## 🤓 Author(s)

Ahmad Nasir - [@ahmad-nasir001](https://linkedin.com/in/ahmad-nasir001) - an7539661@gmail.com



<p align="right">(<a href="#readme-top">back to top</a>)</p>


