//
//  DetailViewController.swift
//  Project1
//
//  Created by burk burs on 26.01.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    var selectedImage:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedImage
        // for making tabbar title little
        navigationItem.largeTitleDisplayMode = .never
        if let imageToLoad = selectedImage {
            image.image = UIImage(named: imageToLoad)
        }
        
    }
    
    // this code run when this viewcontroller opened
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnTap = true
    }
    
    // this code run when this viewcontroller closed
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.hidesBarsOnTap = false
    }
    
    
}
