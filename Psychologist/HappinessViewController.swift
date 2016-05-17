//
//  HappinessViewController.swift
//  Happiness
//
//  Created by Salim Mimouni on 12/05/2016.
//  Copyright © 2016 Salim Mimouni. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource
{
    
    
    @IBOutlet weak var faceView: FaceView! {
        
        didSet {
            faceView.dataSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: #selector(FaceView.scale)))
            
        }
        
        
    }
    
    var happiness: Int = 60 { // 0 very sad, 100 ecstatic
    
        didSet {
            happiness = min(max(0,happiness),100)
            print("happiness = \(happiness)")
            updateUI()
        }
        
    
    }
    
    private struct Constants {
        static let HappinessGestureScale: CGFloat = 4
    }
    
    @IBAction func changeHappiness(gesture: UIPanGestureRecognizer) {
        
        switch gesture.state {
        case .Ended: fallthrough
        case .Changed:
            let translation = gesture.translationInView(faceView)
            let happinessChange = -Int(translation.y / Constants.HappinessGestureScale)
            if happinessChange != 0 {
                happiness += happinessChange
                gesture.setTranslation(CGPointZero, inView: faceView)
            }
        default:break
            
            
        }
    }
    
    
    func updateUI()
    {
        
        faceView?.setNeedsDisplay()
        title = "\(happiness)"
        
    }
    
    func smilinessForFaceView(sender: FaceView) -> Double? {
        
        return Double((happiness-50)/50)
    }
    

    
}
