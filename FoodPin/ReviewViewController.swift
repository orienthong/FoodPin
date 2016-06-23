//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by 洪浩东 on 16/6/23.
//  Copyright © 2016年 AppCoda. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIButton!
    
    
    var rating : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //为照片添加玻璃效果
        let blurEffect = UIBlurEffect(style: .Dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.bounds
        imageView.addSubview(blurView)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ratingSelected(sender: UIButton){
        switch sender.tag {
        case 100:
            rating = "wink"
        case 200:
            rating = "question"
        case 300:
            rating = "sad"
        default:
            break
        }
        
        performSegueWithIdentifier("unwIndToDetailView", sender: sender)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
