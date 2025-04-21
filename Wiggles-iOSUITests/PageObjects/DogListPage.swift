//
//  DogListPage.swift
//  Wiggles-iOS
//
//  Created by Aishwarya Ghandhi Natarajan on 18/04/2025.
//

import XCTest

public class DogListPage: BaseTest {
    
    struct DogDetailVerificationResult {
        let dogName: String
        let success: Bool
        let errors: [String]
    }
    
    override var rootElement: XCUIElement {
        return element("greetingText")
    }
    
    // Fetch all “dogCard_…” elements
    func dogCards() -> XCUIElementQuery {
        return elements(matching: "dogCard_")
    }

    // Get Count of Dog Cards
    @discardableResult
    func getDogCardsCount(expectedCount: Int? = nil) -> Int {
        let cards = dogCards()
        let exists = cards.element.waitForExistence(timeout: 5)
        if !exists {
            takeScreenshot(name: "NoDogCardsFound")
        }
        
        let count = cards.count
        if let expected = expectedCount {
            XCTAssertEqual(count, expected, "Expected \(expected) dog cards, but found \(count).")
        }
        return count
    }
    
    func extractDogName(from identifier: String) -> String {
        return identifier.replacingOccurrences(of: "dogCard_", with: "")
    }
    
    func verifyDetailsForAllDogs() -> [DogDetailVerificationResult] {
        let cards = dogCards().allElementsBoundByIndex
        var results: [DogDetailVerificationResult] = []

        for card in cards {
            let identifier = card.identifier
            let expectedDogName = extractDogName(from: identifier)
            print(expectedDogName)
            var errors: [String] = []
            card.tap()

            let detailPage = DogDetailPage()

            let actualDogName = detailPage.getDogName()
            if actualDogName != expectedDogName {
                errors.append("Expected name '\(expectedDogName)', got '\(actualDogName)'")
                takeScreenshot(name: "\(expectedDogName)_NameMismatch")
            }

            let dogAge = detailPage.getAgeAboutText()
            if dogAge.isEmpty {
                errors.append("Age/About text is empty")
            }

            if !detailPage.hasGenderView() {
                errors.append("Gender view not visible")
            }

            let ownerTitle = detailPage.getOwnerInfoTitle()
            if ownerTitle != "Owner Info" {
                errors.append("Expected owner title 'Owner Info', got '\(ownerTitle)'")
            }

            if !detailPage.isAdoptButtonVisible() {
                errors.append("Adopt button not visible or not tappable")
            }

            detailPage.goBack()

            results.append(DogDetailVerificationResult(
                dogName: expectedDogName,
                success: errors.isEmpty,
                errors: errors
            ))
        }
        return results
    }

}



