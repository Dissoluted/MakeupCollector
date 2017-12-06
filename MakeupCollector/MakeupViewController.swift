//
//  MakeupViewController.swift
//  MakeupCollector
//
//  Created by Sophie Amin on 2017-12-04.
//  Copyright © 2017 Sophie Amin. All rights reserved.
//

import UIKit

class MakeupViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   @IBOutlet weak var makeupImageView: UIImageView!
    
    @IBOutlet weak var productNameTextField: UITextField!
 
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

         // Do any additional setup after loading the view.
        imagePicker.delegate = self
    }

    @IBAction func photosTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary //bug in ios11 where privacy media library usage description doesn't appear anymore?
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        makeupImageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
    }
    @IBAction func addTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let makeup = Makeup(context: context)
        makeup.productName = productNameTextField.text
        makeup.image = UIImagePNGRepresentation(makeupImageView.image!)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
    
 
}
