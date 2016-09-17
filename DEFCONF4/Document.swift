// DEFCONF4 Created by mason on 2016-08-07. Copyright © 2016 MASON MARK (.COM). All rights reserved.

import Cocoa

class Document: NSDocument {
    
    @IBOutlet var missionListViewEnclosure: NSView!

    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }

    override class func autosavesInPlace() -> Bool {
        return true
    }

    override var windowNibName: String? {
        // Returns the nib file name of the document
        // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this property and override -makeWindowControllers instead.
        return "Document"
    }
    
    override func windowControllerDidLoadNib(_ windowController: NSWindowController) {

        if let vc = TargetListViewController(nibName: "TargetListView", bundle: nil) {
            vc.view.frame = missionListViewEnclosure.frame
            vc.view.autoresizingMask = missionListViewEnclosure.autoresizingMask
              // one of the major advntages of autoresizing mask vs contraints... doing that with constraints is an absurd amount of code.
            
            missionListViewEnclosure.superview?.replaceSubview(missionListViewEnclosure, with: vc.view)
        } else {
            fatalError("wtf bro fhjkadfsjkdsh3678hiaf")
        }
        
    }

    override func data(ofType typeName: String) throws -> Data {
        // Insert code here to write your document to data of the specified type. If outError != nil, ensure that you create and set an appropriate error when returning nil.
        // You can also choose to override fileWrapperOfType:error:, writeToURL:ofType:error:, or writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }

    override func read(from data: Data, ofType typeName: String) throws {
        // Insert code here to read your document from the given data of the specified type. If outError != nil, ensure that you create and set an appropriate error when returning false.
        // You can also choose to override readFromFileWrapper:ofType:error: or readFromURL:ofType:error: instead.
        // If you override either of these, you should also override -isEntireFileLoaded to return false if the contents are lazily loaded.
        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }


}

