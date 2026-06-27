# VangtiChai Mobile Application

DEPARTMENT OF COMPUTER SCIENCE AND ENGINEERING  
CSE 489: Mobile Application Development - Assignment 1  

## Overview
**VangtiChai** is a Flutter application designed to calculate change breakdown in Bangladeshi Taka notes (500, 100, 50, 20, 10, 5, 2, 1) for any user-entered amount.

The application features a custom numeric keypad built from scratch and adapts gracefully between **Portrait** and **Landscape** orientations as well as phone and tablet form factors.

## Features
- **Custom Keypad**: Supports digits `0-9` and a `CLEAR` button. Digit entries append automatically from the right.
- **Dynamic Calculation**: Instantly updates counts for each Taka note denomination upon keypress.
- **Adaptive Layouts**:
  - **Portrait Mode**: Single column list of notes on the left and a 3-column numeric keypad grid on the right (`CLEAR` spanning 2 columns).
  - **Landscape Mode**: Dual column list of notes on the left (500-20 and 10-1) and a 4-column numeric keypad grid on the right (`CLEAR` spanning 2 columns).
- **State Preservation**: Retains active input and calculation breakdown across device rotation and configuration changes.

## Testing & Compatibility
Tested on Android Studio Emulators:
- **Pixel XL** (Phone) - Portrait & Landscape
- **Nexus 10** (Tablet) - Portrait & Landscape
- **Pixel 7 Pro** & **Pixel Tablet**

## How to Run
1. Ensure Flutter SDK is installed.
2. Clone this repository:
   ```bash
   git clone https://github.com/siffyyrox-x/VangtiChai.git
   cd VangtiChai
   ```
3. Run the application:
   ```bash
   flutter run
   ```
