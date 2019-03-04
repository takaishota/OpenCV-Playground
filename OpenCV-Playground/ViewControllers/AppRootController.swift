//
//  AppRootController.swift
//  OpenCV-Playground
//
//  Created by 高井　翔太 on 2019/01/31.
//  Copyright © 2019年 takaishota. All rights reserved.
//

import UIKit

class AppRootController: UIViewController {
    var mainNavigationController: UINavigationController?

    var statusBarIsHidden: Bool = true {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }

    override var prefersStatusBarHidden: Bool {
        return statusBarIsHidden
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let vc = R.storyboard.main().instantiateInitialViewController() else {
            return
        }
        setInitialViewController(vc)
    }

    private func setInitialViewController(_ viewController: UIViewController) {
        let nav = { () -> UINavigationController in
            let nav = UINavigationController(rootViewController: viewController)
            return nav
        }()
        addChild(nav)
        view.addSubview(nav.view)
        mainNavigationController = nav
        mainNavigationController?.didMove(toParent: self)
    }
}
