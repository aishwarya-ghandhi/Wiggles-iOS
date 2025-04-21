# Dog Adoption App – UI Automation Test Suite

## Overview

This project includes 3 UI automation tests for the Dog Adoption App, built using `XCTest` in Swift. The app consists of:

- A **Dog List Page** displaying adoptable dogs.
- A **Dog Detail Page** showing individual dog information upon selection.

These tests validate core UI functionality, navigation flow, and data integrity.

---

## Test Scenarios

### 1. App Launches Successfully
- Verifies the app launches and the greeting text is visible.

### 2. Correct Number of Dogs is Listed for Adoption
- Confirms the list displays the expected number of adoptable dogs (expecting 6 puppies).

### 3. Dog Detail Page Displays Correct Information
- Ensures the selected dog’s name, age, gender, owner info, and the "Adopt Me" button are correctly shown on the detail screen.

---

## Code Changes – Accessibility Identifiers

To improve test stability and follow UI automation best practices, accessibility identifiers were added to key UI components:

- **Home View:** `greetingText`, `dogCard_#`, etc.
- **Detail View:** `backButton`, `dogName`, `dogGender`, `adoptMeButton`, etc.

These identifiers allow precise element targeting and increase test reliability.

---

## Setup

No external dependencies required.

To run the tests:

1. Open the Xcode project.
2. Select the correct test target.
3. Run the tests using `Cmd + U`.

---

## Notes

### 🕵️‍♀️ Exploratory Testing Conducted

- Verified navigation logic and UI consistency across screens.
- Audited for accessibility support and VoiceOver compatibility, especially on the detail screen.

For test code implementation, please refer to:
📄 `Wiggles_iOSUITests.swift`
