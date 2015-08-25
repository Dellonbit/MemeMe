//
//  DetailedMemeViewController.swift
//  MemeMe
//
//  Created by arianne on 2015-08-05.
//  Copyright (c) 2015 della. All rights reserved.
//

import UIKit

class DetailedMemeViewController: UIViewController {
    
    var memeImage:UIImage!
    var tableIndex = 0
    
    @IBOutlet weak var memeDetails: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let editBtn = UIBarButtonItem(title: "Edit", style: UIBarButtonItemStyle.Plain, target: self,action: Selector("editBtnPressed:"))
        var deleteBtn : UIBarButtonItem = UIBarButtonItem(title: "Delete", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("deleteBtnPressed:"))
        var buttons = [editBtn, deleteBtn]
        navigationItem.rightBarButtonItems = buttons
        
        if memeImage != nil {
           memeDetails.image = memeImage
        }
       
    }
    
    func editBtnPressed(sender: AnyObject){
        if memeDetails.image == nil {
            showMessage()
            return
        }
        
        else {   performSegueWithIdentifier("edit", sender: self)
        }
    
    }
    
    func showMessage(){
        let alert = UIAlertController(title: "Error", message: "Image has been deleted", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func deleteBtnPressed(sender: AnyObject){
        if memeDetails.image != nil {
        let objecttive = UIApplication.sharedApplication().delegate
        let appDelegate = objecttive as! AppDelegate
        appDelegate.memes.removeAtIndex(tableIndex)
        memeDetails.image = nil
        }
        else {
           showMessage()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let objecttive = UIApplication.sharedApplication().delegate
        let appDelegate = objecttive as! AppDelegate
        var DestViewController = segue.destinationViewController as! UINavigationController
        let memeobj = appDelegate.memes[tableIndex]
        let targetController = DestViewController.topViewController as! MemeEditorViewController
        targetController.editMemeImage = memeobj.image
        
    }
}
