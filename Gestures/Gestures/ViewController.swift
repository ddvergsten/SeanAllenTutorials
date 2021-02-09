//
//  ViewController.swift
//  Gestures
//
//  Created by David Dvergsten on 2/8/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let myView = UIView(frame: CGRect(x:0 , y:0 , width:200, height:200))
        myView.backgroundColor = .red
        myView.center = view.center
        view.addSubview(myView)
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gestureFired(blah: )))
        gestureRecognizer.numberOfTapsRequired = 1
        gestureRecognizer.numberOfTouchesRequired = 1
         
        view.addGestureRecognizer(gestureRecognizer)
        //myView.addGestureRecognizer(gestureRecognizer)
        myView.isUserInteractionEnabled = true
        self.view.isUserInteractionEnabled = true
        
    }


    @objc func gestureFired(blah gesture:UITapGestureRecognizer){
        let touchPoint = gesture.location(in: self.view)
        
        print("gesture fired at x:\(touchPoint.x) y:\(touchPoint.y)")
    }
}

