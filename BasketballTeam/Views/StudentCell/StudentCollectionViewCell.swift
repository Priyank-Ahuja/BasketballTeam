//
//  StudentCollectionViewCell.swift
//  BasketballTeam
//
//  Created by Priyank Ahuja on 9/9/24.
//

import UIKit

class StudentCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var asuIdLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var abc: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellView.layer.cornerRadius = 10
        abc.layer.cornerRadius = abc.bounds.width/2
    }
    
    func setupInterface(student: Student) {
        firstNameLabel.text = "\(student.firstName ?? "") \(student.lastName ?? "")"
        asuIdLabel.text = "\(student.asuId)"
        abc.image = student.image
    }

}
