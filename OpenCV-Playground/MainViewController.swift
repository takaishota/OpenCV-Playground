//
//  ViewController.swift
//  OpenCV-Playground
//
//  Created by 高井　翔太 on 2019/01/29.
//  Copyright © 2019年 takaishota. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func selectPhoto(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.navigationBar.isHidden = false
        imagePicker.modalPresentationStyle = .overCurrentContext
        present(imagePicker, animated: true, completion: nil)
    }
}

extension MainViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.originalImage] as? UIImage else {
            fatalError("picking imgage is invalid")
        }

        picker.dismiss(animated: true, completion: nil)
        guard let vc = R.storyboard.preview().instantiateInitialViewController() as? PreviewViewController else {
            fatalError("previewView instantiation is failed")
        }
        vc.preview = image
        navigationController?.pushViewController(vc, animated: true)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

