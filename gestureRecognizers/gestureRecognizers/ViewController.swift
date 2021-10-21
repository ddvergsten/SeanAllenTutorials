//
//  ViewController.swift
//  gestureRecognizers
//
//  Created by David Dvergsten on 10/21/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var trashimage: UIImageView!
    @IBOutlet weak var fileimage: UIImageView!
    var fileViewOrigin: CGPoint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addPanGesture(view: fileimage)
        fileViewOrigin = fileimage.frame.origin
        view.bringSubviewToFront(fileimage)
    }

    func addPanGesture(view: UIView){
        let pan = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handlePanGesture(sender: )))
        self.fileimage.addGestureRecognizer(pan)
        
    }

    @objc func handlePanGesture(sender: UIPanGestureRecognizer){
        let fileView = sender.view!
        let translation = sender.translation(in: view)
        
        switch sender.state
        {
        case .began, .changed:
            fileView.center = CGPoint(x: fileView.center.x + translation.x, y: fileView.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: view)
        case .ended:
            if fileView.frame.intersects(trashimage.frame){
                UIView.animate(withDuration: 0.3, animations: {self.fileimage.alpha = 0.0})
            }
            else{
                self.fileimage.frame.origin = fileViewOrigin
            }
        default:
            break
        }
    }
}

