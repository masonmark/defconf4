// TreeNode.swift Created by mason on 2016-08-07. Copyright © 2016 MASON MARK (.COM). All rights reserved.
//
// ...a Swift rethink of: NakaharaTreeNode.m Created by mason on 2008-06-05.
// 2016-09-17 UPDATE: IN PROGRESS BUT DONT WANNA JUNK UP MASON.SWIFT WITH THIS... IF THIS IS EVER DONE, AND GOOD, OR AT LEAST OK, THEN MERGE IT IN AT SUCH TIME


import Foundation


/// Implements the fundamental aspects of a tree node.

protocol TreeNode {
    
    var representedObject: Any? { get set }
    
    var title: String? { get set }
    
    // image will go in extension, maybe?
    
    var isLeafNode: Bool { get }
    
    var childNodes: [TreeNode]? { get }
    
    var loadError: Error? { get }
    
    var hasLoaded: Bool { get }
    
    var isLoading: Bool { get }
    var isReloading: Bool { get }
    
}


/// This protocol extension defines some default behaviors.

extension TreeNode {
    
    var hasLoaded: Bool {
        return childNodes != nil
    }
    
    var isLeafNode: Bool {
        guard hasLoaded else {
            return false
        }
        guard let childNodes = childNodes else {
            return false
        }
        return childNodes.count == 0
    }
}


/// Minimal concrete implementation

public class BaseTreeNode: TreeNode {
    var representedObject: Any?
    var title: String?
    var childNodes: [TreeNode]?
    var loadError: Error?
    var isLoading: Bool = false
    var isReloading: Bool = false
    
    init(representedObject: Any?) {
        self.representedObject = representedObject
    }
}


/// MacTreeNode is a full-fledged concrete implementation, based on NSObject so that it can support KVO, so that it can be used with Cocoa Bindings, NSTreeController, etc.

public class MacTreeNode: NSObject, TreeNode {
    
    var representedObject: Any?
    var title: String?
    var childNodes: [TreeNode]?
    var loadError: Error?
    var isLoading: Bool = false
    var isReloading: Bool = false
    
    public init(representedObject: AnyObject? = nil, title: String? = nil) {
        self.representedObject = representedObject
        self.title = title
    }
}


// This is essentially a Swift port, with some re-thinking, of: NakaharaTreeNode.m (2008)
//
// Something like NSTreeNode without being Mac-specific or *requiring* AppKit .
//
// The purpose is to create a generic interface that may be implemented by any object, and which gives our UI classes (like table controllers in Touch/Cocoa/other) enough data to do their job of displaying tree-like lists (filesystem hierarchy, preference settings, address book, etc etc) without knowing about the objects themselves. My current thinking is that WRAPPING every object all the time is too much hassle (although it does work when need be), but making model objects SUBCLASS a tree node primitive object is also unacceptably kludgey, so this is the only practical way to accomplish my goal. It is still a little bit clunkorama to make simple-ass model objects implement all these methods, but it is the best idea I can come up with (Mason Tue, Jun 10, 2008)
