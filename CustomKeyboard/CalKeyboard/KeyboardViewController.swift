//
//  KeyboardViewController.swift
//  CalKeyboard
//
//  Created by Gene Yoo on 9/15/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController, UITextFieldDelegate {

    @IBOutlet weak var smsKeyboardButton: UIButton!
    @IBOutlet weak var twitterKeyboardButton: UIButton!
    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet weak var returnKeyboardButton: UIButton!
    @IBOutlet weak var deleteKeyboardButton: UIButton!
    @IBOutlet weak var emailKeyboardButton: UIButton!
    
    var keyboardView: UIView!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }
    
    func inputForTwitter() {
        let text = self.textDocumentProxy as UITextDocumentProxy
        text.insertText("@wwinniew")
    }
    func inputForReturn() {
        let text = self.textDocumentProxy as UITextDocumentProxy
        text.insertText("\n ")
    }
    
    func inputForDelete() {
        let text = self.textDocumentProxy as UITextDocumentProxy
        text.deleteBackward()
    }
    
    func inputForEmail() {
        let text = self.textDocumentProxy as UITextDocumentProxy
        text.insertText("winniewenw@gmail.com")
    }
    
    func inputForTextnumber() {
        let text = self.textDocumentProxy as UITextDocumentProxy
        text.insertText("415-XXX-XXXX")
    }
    
    

    func loadInterface() {
        let keyboardNib = UINib(nibName: "Keyboard", bundle: nil)
        keyboardView = keyboardNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        keyboardView.frame = view.frame
        view.addSubview(keyboardView)
        view.backgroundColor = keyboardView.backgroundColor
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside) // advanceToNextInputMode is already defined in template
        returnKeyboardButton.addTarget(self, action: "inputForReturn", forControlEvents: .TouchUpInside)
        deleteKeyboardButton.addTarget(self, action: "inputForDelete", forControlEvents: .TouchUpInside)
        twitterKeyboardButton.addTarget(self, action: "inputForTwitter", forControlEvents: .TouchUpInside)
        emailKeyboardButton.addTarget(self, action: "inputForEmail", forControlEvents: .TouchUpInside)
        smsKeyboardButton.addTarget(self, action: "inputForTextnumber", forControlEvents: .TouchUpInside)
        
    }


}
