//
//  CustomButton.swift
//  BasketballTeam
//
//  Created by Priyank Ahuja on 9/12/24.
//

import UIKit

class CustomButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
    func setup() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        self.layer.backgroundColor = UIColor.systemBlue.cgColor
        self.tintColor = UIColor.black
    }
    
}
