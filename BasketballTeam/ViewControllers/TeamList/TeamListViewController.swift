//
//  TeamListViewController.swift
//  BasketballTeam
//
//  Created by Priyank Ahuja on 9/9/24.
//

import UIKit

class TeamListViewController: UIViewController {

    @IBOutlet weak var emptyListLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var students: [Student]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.register(UINib(nibName: "StudentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StudentCollectionViewCell")
        
        fetchData()
    }
    
    func fetchData() {
        do {
            self.students = try context.fetch(Student.fetchRequest())
            print("students", students?.count ?? -1)
            
            if (students?.count == 0) {
                self.emptyListLabel.isHidden = false
            } else {
                self.emptyListLabel.isHidden = true
            }

            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        } catch {
            
        }
        
    }
}

extension TeamListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.students?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let student = self.students?[indexPath.row] else {return UICollectionViewCell()}
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StudentCollectionViewCell", for: indexPath) as! StudentCollectionViewCell
        cell.setupInterface(student: student)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.bounds.width/2 - 30, height: 220)
    }
    
}
