//
//  HeaderCell.swift
//  Lecture49
//
//  Created by Nika Kirkitadze on 6/25/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    public static let identifier = "HeaderCell"
    
    var profilePictures = [ProfilePicture]()
    var selectedPhotoIndex : Int = 0
    var didSelectItemAction: ((IndexPath) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(StoryCell.self, forCellWithReuseIdentifier: StoryCell.identifier)
        
        let pic1 = ProfilePicture(picture: UIImage(named: "pic1")!)
        let pic2 = ProfilePicture(picture: UIImage(named: "pic2")!)
        let pic3 = ProfilePicture(picture: UIImage(named: "pic3")!)
        let pic4 = ProfilePicture(picture: UIImage(named: "pic4")!)
        let pic5 = ProfilePicture(picture: UIImage(named: "pic5")!)
        let pic6 = ProfilePicture(picture: UIImage(named: "pic6")!)
        let pic7 = ProfilePicture(picture: UIImage(named: "pic7")!)
        let pic8 = ProfilePicture(picture: UIImage(named: "pic8")!)
        
        profilePictures.append(pic1)
        profilePictures.append(pic2)
        profilePictures.append(pic3)
        profilePictures.append(pic4)
        profilePictures.append(pic5)
        profilePictures.append(pic6)
        profilePictures.append(pic7)
        profilePictures.append(pic8)
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension HeaderCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profilePictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCell.identifier, for: indexPath) as! StoryCell
        
        cell.imageView.image = profilePictures[indexPath.row].picture
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedPhotoIndex = indexPath.row
        print(indexPath.row)
        didSelectItemAction?(indexPath)
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 172/2, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 30, bottom: 0, right: 80)
    }
}


class StoryCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 85/2
        iv.layer.borderWidth = 2.5
        //iv.layer.borderColor = UIColor.red.cgColor
        iv.layer.borderColor = Colors.MossGreen.cgColor
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        
        let whiteLayer = CALayer()
        whiteLayer.frame = CGRect.init(x: 0, y: 0, width: 85, height: 85)
        whiteLayer.borderColor = UIColor.white.cgColor
        whiteLayer.borderWidth = 5
        whiteLayer.cornerRadius = 85/2
        iv.layer.addSublayer(whiteLayer)
        
//        let layer = CAShapeLayer()
//        let bounds = CGRect(x: 3.5, y: 3.5, width: 78, height: 78)
//        layer.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 39, height: 39)).cgPath
//        layer.strokeColor = UIColor.systemPink.cgColor
//        layer.fillColor = nil
//        layer.lineDashPattern = [8, 6]
//        iv.layer.addSublayer(layer)
//
//        layer.lineDashPattern?.reduce(0) { $0 - $1.intValue } ?? 0
//
//        let animation = CABasicAnimation(keyPath: "lineDashPhase")
//        animation.fromValue = 0
//        animation.toValue = layer.lineDashPattern?.reduce(0) { $0 - $1.intValue } ?? 0
//        animation.duration = 0.7
//        animation.repeatCount = .infinity
//        layer.add(animation, forKey: "line")
        

        return iv
    }()
    
    let userLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = Font.SourceSansProRegular?.withSize(15)
        l.textColor = Colors.DarkGray
        l.text = "Full Name"
        return l
    }()
    
    public static let identifier = "StoryCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    private func setupLayout() {
        addSubview(imageView)
        addSubview(userLabel)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 85),
            imageView.heightAnchor.constraint(equalToConstant: 85),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            userLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            userLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}

struct ProfilePicture {
    var picture: UIImage
}
