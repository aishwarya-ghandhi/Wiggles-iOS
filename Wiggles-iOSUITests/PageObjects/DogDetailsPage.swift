//
//  DogDetailsPage.swift
//  Wiggles-iOS
//
//  Created by Aishwarya Ghandhi Natarajan on 18/04/2025.
//

import XCTest

public class DogDetailPage: BaseTest {
    
    // Root element of the Dog Detail page is identified by "dogStory" accessibility identifier
    override var rootElement: XCUIElement {
        return element("dogStory")
    }

    func getDogName() -> String {
        return element("dogName").label
    }

    func getAgeAboutText() -> String {
        return element("dogAge").label
    }

    func hasGenderView() -> Bool {
        return element("dogGender").exists
    }

    func getOwnerInfoTitle() -> String {
        return element("ownerInfoTitle").label
    }

    // Function to check if the 'Adopt me' button is visible and tappable
    func isAdoptButtonVisible() -> Bool {
        // Swipe Up to make Adopt me button visible
        element("dogStory").swipeUp()
        let button = element("adoptMeButton")
        return button.exists && button.isHittable
    }

    // Function to go back to the previous page by swiping down and tapping the back button
    func goBack() {
        // Swipe Down to make back button visible
        element("dogStory").swipeDown()
        element("backButton").tap()
    }
}

