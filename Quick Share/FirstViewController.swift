//
//  FirstViewController.swift
//  Quick Share
//
//  Created by Chuck Harpke on 12/25/15.
//  Copyright © 2015 Chuck Harpke. All rights reserved.
//

import UIKit
import Social

class FirstViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func cameraTapped(sender: AnyObject) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
        
            imagePickerController.sourceType = .Camera
            
        }else {
        
            imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        }
        
        self.presentViewController(imagePickerController, animated: true, completion: nil)

    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imageView.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func shareTapped(sender: AnyObject) {
        
        if imageView.image != nil {
        
        let facebook = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            facebook.addImage(imageView.image)
            
            self.presentViewController(facebook, animated: true, completion: nil)
        
        }else {
            print ("No Image selected to share on Facebook")
        
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

