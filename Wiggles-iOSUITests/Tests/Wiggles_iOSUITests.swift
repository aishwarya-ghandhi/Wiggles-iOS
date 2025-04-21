//
//  Wiggles_iOSUITests.swift
//  Wiggles-iOS
//
//  Created by Aishwarya Ghandhi Natarajan on 18/04/2025.
//

import XCTest

class Wiggles_iOSUITests: XCTestCase {
    
    // Set up before each test case runs
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch() // Launch the app before each test
    }
    
    // Test that the app launches successfully
    func testAppLaunchesSuccessfully() {
        let dogListPage = DogListPage() // This uses BaseTest's init to verify rootElement
        // Verify the app launches successfully and the greeting text is displayed
        XCTAssertTrue(dogListPage.rootElement.exists, "Greeting text should be visible on launch.")
    }
    
    // Test that the number of dogs available to adopt is correct (expecting 6 puppies)
    func testNumberOfDogsAvailableToAdopt() {
        let dogListPage = DogListPage()
        let count = dogListPage.getDogCardsCount()
        XCTAssertEqual(count, 6, "Expected 6 puppies available to adopt, but found \(count).")
    }
 
    // Test that the dog details page content is correct for all dogs
    func testDogDetailsPageContentIsCorrect(){
        // Retrieve results of verifying dog details for all dogs
        let results = DogListPage().verifyDetailsForAllDogs()
        for result in results {
            if result.success {
                XCTAssertTrue(result.success, "✅ \(result.dogName): All details verified successfully.")
            } else {
                // Use XCTFail to handle failure cases
                XCTFail("❌ \(result.dogName): Failed with errors:\n - " + result.errors.joined(separator: "\n - "))
            }
        }
    }
}
