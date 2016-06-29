//
//  MapViewController.swift
//  FoodPin
//
//  Created by 洪浩东 on 16/6/24.
//  Copyright © 2016年 AppCoda. All rights reserved.
//

import UIKit
import MapKit



class MapViewController: UIViewController , MKMapViewDelegate{

    @IBOutlet weak var mapView : MKMapView!
    
    var restaurant : Restaurant!
    override func viewDidLoad() {
        super.viewDidLoad()
        //添加位置
        let geoCoder = CLGeocoder()
        print(restaurant.location)
        geoCoder.geocodeAddressString(restaurant.location, completionHandler: { placemarks , error in
            
            //如果有错误
            if error != nil {
                print(error)
                return
            }
            if let placemarks = placemarks {
                //get the first plackmark
                let placemark = placemarks[0]
                
                //add annotation 
                let annotation = MKPointAnnotation()
                annotation.title = self.restaurant.name
                annotation.subtitle = self.restaurant.type
                
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    
                    //display the annotations
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                    
                }
            }
        })
        
        mapView.showsScale = true
        mapView.showsCompass = true
        mapView.showsTraffic = true
        // Do any additional setup after loading the view.
        
        //无限懵逼 为什么放在最下面才能正常使用
//        mapView.delegate = self

    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPin"
        
        //不会改变显示当前位置的小蓝点（button）
        if annotation.isKindOfClass(MKUserLocation)
        {
            return nil
        }
        
        //cheak 是否有可用的view？
        var annotationView : MKPinAnnotationView? = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView
        
        
        if annotationView == nil {
            //创建新的annotationView
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            
            //是否通过点击注释显示气泡
            annotationView?.canShowCallout = true
        }
        let leftIconView = UIImageView(frame: CGRectMake(0, 0, 53, 53))
        leftIconView.image = UIImage(data: restaurant.image!)//CocaData
        annotationView?.leftCalloutAccessoryView = leftIconView
        
        
        //修改pin的颜色
        annotationView?.pinTintColor = UIColor.orangeColor()
        
        return annotationView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
