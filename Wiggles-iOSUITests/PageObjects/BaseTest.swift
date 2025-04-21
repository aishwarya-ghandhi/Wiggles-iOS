//
//  BaseTest.swift
//  Wiggles-iOS
//
//  Created by Aishwarya Ghandhi Natarajan on 18/04/2025.
//

import XCTest

class Logger {
    func log(_ mlog: String){
        NSLog(mlog)
    }
}

public class BaseTest {
    
    let app = XCUIApplication()
    let log = Logger().log
    
    // Waits for screen to load before continuing
    required init(timeout: TimeInterval = 20) {
        log("Waiting \(timeout)s for \(String(describing: Self.self)) to load.")
        let exists = rootElement.waitForExistence(timeout: timeout)
        if !exists {
            takeScreenshot(name: "FailedToLoad_\(Self.self)")
        }
        XCTAssertTrue(exists, "Expected screen \(Self.self) did not load in \(timeout)s.")
    }
    
    // Override this in subclasses to define when the screen is "loaded"
    var rootElement: XCUIElement {
        fatalError("subclass should override rootElement")
    }
    
    // Takes screenshot
    func takeScreenshot(name: String) {
        let screenshot = XCUIScreen.main.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = name
        attachment.lifetime = .keepAlways

        XCTContext.runActivity(named: "📸 Screenshot: \(name)") { activity in
            activity.add(attachment)
        }

        print("📸 Screenshot captured and attached to test: \(name)")
    }
    
    // Lookup any element by accessibility identifier
    func element(_ identifier: String) -> XCUIElement {
        return app.descendants(matching: .any)[identifier]
    }
    
    // Lookup all elements whose identifier begins with the given prefix
    func elements(matching prefix: String) -> XCUIElementQuery {
        let predicate = NSPredicate(format: "identifier BEGINSWITH %@", prefix)
        return app.descendants(matching: .any).matching(predicate)
    }
    
}
