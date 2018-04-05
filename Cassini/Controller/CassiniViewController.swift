//
//  CassiniViewController.swift
//  Cassini
//
//  Created by Tomasz Bogusz on 05.04.2018.
//  Copyright © 2018 Tomasz Bogusz. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController {

    // MARK: - View Controller's Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if let url = DemoURLs.NASA[identifier] {
                if let imageVC = segue.destination.contents as? ImageViewController {
                    imageVC.imageURL = url
                    imageVC.title = (sender as? UIButton)?.currentTitle
                }
            }
        }
    }
}

// MARK: - Convenience extension to return contents if NavigationController
extension UIViewController {
    var contents: UIViewController {
        if let navcon = self as? UINavigationController {
            return navcon.visibleViewController ?? self
        } else {
            return self
        }
    }
}
