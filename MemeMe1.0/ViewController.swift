//
//  ViewController.swift
//  MemeMe1.0
//
//  Created by Yar Sher on 1/28/19.
//  Copyright © 2019 Yar Sher. All rights reserved.
//

import UIKit

class ViewController: UIViewController,  UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

    @IBOutlet weak var imagePickerView: UIImageView!
    @IBOutlet weak var cameraPickerButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cameraPickerButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func pickAnImage(_ sender: Any) {
        
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func pickAnImageFromCamera(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        if let image = info[.originalImage] as? UIImage {
            imagePickerView.image = image
            
            dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_: UIImagePickerController){
        dismiss(animated: true, completion: nil)
    }
    

}

