//
//  PreviewViewController.swift
//  OpenCV-Playground
//
//  Created by 高井　翔太 on 2019/01/30.
//  Copyright © 2019年 takaishota. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {
    let openCV = OpenCVWrapper()
    var originalImage: UIImage?
    var preview: UIImage? {
        didSet {
            previewImageView.image = preview
        }
    }

    @IBOutlet weak var previewImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        preview = originalImage
    }

    @IBAction func mean(_ sender: UIButton) {
        preview = openCV.mean(originalImage)
    }

    @IBAction func convertColor(_ sender: UIButton) {
        preview = openCV.convertToGrayScale(with: originalImage)
    }

    @IBAction func threshold(_ sender: UIButton) {
        preview = openCV.threshold(originalImage)
    }

    @IBAction func setOriginal(_ sender: UIButton) {
        preview = originalImage
    }
}
