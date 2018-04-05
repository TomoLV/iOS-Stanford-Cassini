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
            image = nil
            // Check if I'm on screen
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    // MARK: - Instance properties
    var imageView = UIImageView()
    // Use computed property image for better code
    private var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView.contentSize = imageView.frame.size
        }
    }

    // MARK: - Outlets
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.minimumZoomScale = 1/25
            scrollView.maximumZoomScale = 1.0
            scrollView.delegate = self
            scrollView.addSubview(imageView)
        }
    }
    
    // MARK: - View Controller's Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        if imageURL == nil {
//            imageURL = DemoURLs.stanford
//        }
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
                image = UIImage(data: imageData)
            }
        }
    }

}

// MARK: - UIScrollViewDelegate implementation
extension ImageViewController: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
}
