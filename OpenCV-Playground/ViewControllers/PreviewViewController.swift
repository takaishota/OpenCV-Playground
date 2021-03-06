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
    @IBOutlet weak var hueSlider: GradientSlider!
    @IBOutlet weak var removeHueSlider: GradientSlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        preview = originalImage
        hueSlider.actionBlock = { slider, newValue, finished in
            self.preview = self.openCV.extractColor(Int(newValue * 180), from: self.originalImage)
        }
        removeHueSlider.actionBlock = { slider, newValue, finished in
            self.preview = self.openCV.removeColor(Int(newValue * 180), from: self.originalImage)
        }
    }

    @IBAction func mean(_ sender: UIButton) {
        preview = openCV.mean(from: originalImage)
    }

    @IBAction func convertColor(_ sender: UIButton) {
        preview = openCV.convertToGrayScale(from: originalImage)
    }

    @IBAction func threshChanged(_ sender: UISlider) {
        preview = openCV.threshold(from: originalImage, withThresh: Int(sender.value))
    }

    @IBAction func blurSizeChanged(_ sender: UISlider) {
        preview = openCV.blur(originalImage, withSize: Int(sender.value))
    }

    @IBAction func setOriginal(_ sender: UIButton) {
        preview = originalImage
    }
}
