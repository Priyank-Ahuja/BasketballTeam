//
//  AddStudentViewController.swift
//  BasketballTeam
//
//  Created by Priyank Ahuja on 9/9/24.
//

import UIKit

class AddStudentViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var asuIdTextView: UITextField!
    @IBOutlet weak var lastNameTextView: UITextField!
    @IBOutlet weak var firstNameTextView: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var profileImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.profileImageView.layer.cornerRadius = self.profileImageView.bounds.width/2
        self.firstNameTextView.attributedPlaceholder = NSAttributedString(
            string: "First Name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        self.lastNameTextView.attributedPlaceholder = NSAttributedString(
            string: "Last Name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        self.asuIdTextView.attributedPlaceholder = NSAttributedString(
            string: "ASU ID (10 Digits)",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )

        // Do any additional setup after loading the view.
    }
    
    func showAlert(message: String, title:String = "Error saving details") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
       
        if(title == "Student Added") {
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { UIAlertAction in
                DispatchQueue.main.async {
                    self.navigationController?.popViewController(animated: true)
                }
            }))
        } else {
            alert.addAction(UIAlertAction(title: "Retry", style: UIAlertAction.Style.default, handler: nil))
          
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func addImageButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {
            action in
            picker.sourceType = .camera
            self.present(picker, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {
            action in
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func addStudentButtonAction(_ sender: Any) {
        
        guard let firstName = firstNameTextView.text, let lastName = lastNameTextView.text, let asuId = asuIdTextView.text else { return }
        
        if (!firstName.isEmpty && !lastName.isEmpty && !asuId.isEmpty) {
            guard let profileImage else {
                self.showAlert(message: "Please add profile image")
                return
            }
            
            if(asuId.count != 10) {
                self.showAlert(message: "ASU ID must be 10 digits")
                return
            }
            
            let newStudent = Student(context: self.context)
            newStudent.firstName = firstName
            newStudent.lastName = lastName
            newStudent.asuId = Int64(asuId) ?? 0
            newStudent.image = profileImage
            
            do{
                try self.context.save()
                self.showAlert(message: "Go to View List page", title: "Student Added")
            } catch {
                self.showAlert(message: "Please try again")
            }
        } else {
            self.showAlert(message: "Please fill all details")
        }
    }
}

extension AddStudentViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        self.profileImage = image
        self.profileImageView.image = image
        dismiss(animated: true, completion: nil)
    }

      func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
          dismiss(animated: true, completion: nil)
      }
}
