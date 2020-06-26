//
//  StoryViewController.swift
//  Lecture49
//
//  Created by Kato on 6/25/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController {

    @IBOutlet weak var storyImageView: UIImageView!

    var selectedPhoto : Int = 0
    
    var profilePicturesArr = [ProfilePicture]()

    @IBOutlet weak var dismissButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (profilePicturesArr.count != 0) {
            storyImageView.image = profilePicturesArr[selectedPhoto].picture
        }
        // Do any additional setup after loading the view.
        
        dismissButton.layer.cornerRadius = 55/2
        dismissButton.backgroundColor = UIColor(white: 1, alpha: 0.5)
        
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))

        leftSwipe.direction = .left
        rightSwipe.direction = .right

        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        
    }
    
    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer) {

        if (sender.direction == .left) {
                //print("Swipe Left")

            if selectedPhoto < profilePicturesArr.count-1 {
                selectedPhoto += 1
                
            }

        }

        if (sender.direction == .right) {
            //print("Swipe Right")

            if selectedPhoto >= 1 {
                selectedPhoto -= 1
            }

        }
        
        storyImageView.image = profilePicturesArr[selectedPhoto].picture
        
    }

    @IBAction func dismissTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
