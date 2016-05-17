//
//  TextViewController.swift
//  Psychologist
//
//  Created by Salim Mimouni on 16/05/2016.
//  Copyright © 2016 Salim Mimouni. All rights reserved.
//

import UIKit

class TextViewController: UIViewController
{
    
    @IBOutlet weak var textView: UITextView! {
        didSet {
            textView.text = text
        }
    }
    
    var text: String = "" {
        
        didSet {
            textView?.text = text
        }
        
    }
    
    
    override var preferredContentSize: CGSize {
        
        get {
            if textView != nil  && presentingViewController != nil {
                return textView.sizeThatFits(presentingViewController!.view.bounds.size)
            } else {
                
                return super.preferredContentSize
            }
        
        }
        set { super.preferredContentSize = newValue }
        
    }
    

    
}
