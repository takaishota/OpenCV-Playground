//
//  PreviewViewController.swift
//  OpenCV-Playground
//
//  Created by 高井　翔太 on 2019/01/30.
//  Copyright © 2019年 takaishota. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {
    var preview: UIImage?
    @IBOutlet weak var previewImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        previewImageView.image = preview
    }
}
