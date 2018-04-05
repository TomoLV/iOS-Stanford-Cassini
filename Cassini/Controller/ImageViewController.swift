//
//  ImageViewController.swift
//  Cassini
//
//  Created by Tomasz Bogusz on 05.04.2018.
//  Copyright © 2018 Tomasz Bogusz. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    // MARK: - Model
    var imageURL: URL? {
        didSet {
            imageView.image = nil
            // Checki if I'm on screen
            if view.window != nil {
                fetchImage()
            }
        }
    }

    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - View Controller's Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if imageURL == nil {
            imageURL = DemoURLs.stanford
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil {
            fetchImage()
        }
    }
    
    // MARK: - Private functions
    private func fetchImage() {
        if let url = imageURL {
            let urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents {
                imageView.image = UIImage(data: imageData)
            }
        }
    }

}
