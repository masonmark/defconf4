// TargetListViewController.swift Created by mason on 2016-08-09. Copyright © 2016 MASON MARK (.COM). All rights reserved.

import AppKit

class TargetListViewController: NSViewController {
    
    var rootNode: TreeNode?
    
    @IBOutlet var entriesTreeController: NSTreeController!
    @IBOutlet var entriesOutlineView:    NSOutlineView!
    
    // todo: undoManager
    
    override func viewDidLoad() {
        print(#function)
        (view as? ColoredView)?.backgroundColor = NSColor.magenta
    }
    
    
}
