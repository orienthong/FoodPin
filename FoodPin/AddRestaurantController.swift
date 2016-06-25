//
//  AddRestaurantControllerTableViewController.swift
//  FoodPin
//
//  Created by 洪浩东 on 16/6/24.
//  Copyright © 2016年 AppCoda. All rights reserved.
//

import UIKit

class AddRestaurantController: UITableViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var nameTextField : UITextField!
    @IBOutlet weak var typeTextField : UITextField!
    @IBOutlet weak var locationField : UITextField!
    @IBOutlet weak var yesButton : UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            //避免用户拒绝访问图片库的情况
            if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .PhotoLibrary
                
                //跳到某个Controller！很常见
                self.presentViewController(imagePicker, animated: true, completion: nil)
                imagePicker.delegate = self
            }
        }
        //取消选择行一直呈现被选择的样式
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        
    }
    
    
    //“When a user chooses a photo from the photo library, the imagePickerController(_:didFinishPickingMediaWithInfo:) method of the delegate is called.”
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        //有什么作用
        imageView.clipsToBounds = true
        
//        //代码实现添加约束
//        let leadingConstraint = NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: imageView.superview, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0)
//        leadingConstraint.active = true
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func save(sender: UIBarButtonItem){
        let name = nameTextField.text
        let type = typeTextField.text
        let location = locationField.text
        
        if name==""||type==""||location=="" {
            let alertController = UIAlertController(title: "Warning", message: "We can't proceed because one of the fields is blank. Please note that all fields are required.", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(okAction)
            presentViewController(alertController, animated: true, completion: nil)
            
            //return what?
            return
        }
        //点击save 返回
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func toggleBeenHereButton(sender: UIBarButtonItem){
        if sender == yesButton{
            yesButton.backgroundColor = UIColor(red: 235.0/255.0, green:73.0/255.0, blue: 27.0/255.0, alpha: 1.0)
            noButton.backgroundColor = UIColor.grayColor()
        } else if sender == noButton {
            yesButton.backgroundColor = UIColor.grayColor()
            noButton.backgroundColor = UIColor(red: 235.0/255.0, green:73.0/255.0, blue: 27.0/255.0, alpha: 1.0)
        }
    }
}
