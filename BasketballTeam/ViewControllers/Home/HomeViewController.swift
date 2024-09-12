//
//  ViewController.swift
//  BasketballTeam
//
//  Created by Priyank Ahuja on 9/9/24.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addStudentButtonAction(_ sender: Any) {
        let addStudentViewController = AddStudentViewController(nibName: "AddStudentViewController", bundle: nil)
        self.navigationController?.pushViewController(addStudentViewController, animated: true)
    }
    
    @IBAction func viewListButtonAction(_ sender: Any) {
        let teamListViewController = TeamListViewController(nibName: "TeamListViewController", bundle: nil)
        self.navigationController?.pushViewController(teamListViewController, animated: true)
    }
}

