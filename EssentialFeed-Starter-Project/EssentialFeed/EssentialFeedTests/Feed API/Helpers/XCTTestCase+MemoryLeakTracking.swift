//
//  XCTTestCase+MemoryLeakTracking.swift
//  EssentialFeedTests
//
//  Created by Yauheni Karas on 11/11/2025.
//

import XCTest

extension XCTestCase {
    func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #filePath,
                                     line: UInt = #line) {
        addTeardownBlock {[weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocates. Potential memory leak.", file: file, line: line)
        }
    }
}


