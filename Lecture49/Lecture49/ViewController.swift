//
//  ViewController.swift
//  Lecture49
//
//  Created by Nika Kirkitadze on 6/25/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var selectedImage : Int = 0
    
    var profilePicturesArray = [ProfilePicture]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate  = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! StoryViewController
        vc.selectedPhoto = self.selectedImage
        vc.profilePicturesArr = self.profilePicturesArray
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {

            let cell = tableView.dequeueReusableCell(withIdentifier: HeaderCell.identifier, for: indexPath) as! HeaderCell
            
            cell.didSelectItemAction = { [weak self] indexPath in
                
                self!.selectedImage = cell.selectedPhotoIndex
                self!.profilePicturesArray = cell.profilePictures
                self?.performSegue(withIdentifier: "story_segue", sender: self)
                
            }
            
            return cell
            
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: NormalCell.identifier, for: indexPath) as! NormalCell
        return cell
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 622
        }
        
        return 150
    }
}
