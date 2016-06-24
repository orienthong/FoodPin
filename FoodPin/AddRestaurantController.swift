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
    

}
