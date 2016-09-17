// TreeNodeTests.swift Created by mason on 2016-08-07. Copyright © 2016 MASON MARK (.COM). All rights reserved.

import XCTest

class TreeNodeTests: XCTestCase {
    
    func test_basic() {
        let uno    = BaseTreeNode(representedObject: "uno")
        let dos    = BaseTreeNode(representedObject: "dos")
        let tres   = BaseTreeNode(representedObject: "tres")
        let cuatro = BaseTreeNode(representedObject: "cuatro")
        let cinco  = BaseTreeNode(representedObject: "cinco")
        
        uno.childNodes  = [dos, tres]
        dos.childNodes  = [cuatro, cinco]
        tres.childNodes = []
        
        XCTAssertFalse(uno.isLeafNode)
        XCTAssertFalse(dos.isLeafNode)
        XCTAssertTrue(tres.isLeafNode)
        XCTAssertFalse(cuatro.hasLoaded)
        XCTAssertEqual(cinco.representedObject as? String, "cinco")
    }
    
}
