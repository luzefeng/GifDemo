//
//  ViewController.swift
//  GifDemo
//
//  Created by lu on 15/10/31.
//  Copyright © 2015年 lu. All rights reserved.
//

import UIKit
import FLAnimatedImage

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView(){
        let filePath = NSBundle.mainBundle().pathForResource("wuba", ofType: "gif")
        let gif = NSData(contentsOfFile: filePath!)
        
        //无法全屏显示
        //        let webview = UIWebView(frame: self.view.frame)
        //        webview.loadData(gif!, MIMEType: "image/gif", textEncodingName: String(), baseURL: NSURL())
        //        webview.contentMode = UIViewContentMode.ScaleAspectFit
        //        webview.userInteractionEnabled = false
        //
        //        self.view.addSubview(webview)
        
        //用了github上著名的gif显示工具
        let animatedImage = FLAnimatedImage(animatedGIFData: gif)
        let imageView = FLAnimatedImageView(frame: self.view.frame)
        
        imageView.animatedImage = animatedImage
        imageView.userInteractionEnabled = false
        self.view.addSubview(imageView)
        
        //黑色的过滤视图
        let filter = UIView(frame: self.view.frame)
        filter.backgroundColor = UIColor.blackColor()
        filter.alpha = 0.05
        self.view.addSubview(filter)
        let heightUnit = self.view.frame.size.height / 8
        let widthUnit = self.view.frame.size.width / 8
        
        let label = UILabel(frame: CGRect(x: 0, y: heightUnit*2, width: self.view.frame.width, height: heightUnit))
        label.text = "Welcome"
        label.textColor = UIColor.whiteColor()
        label.font = UIFont(name: "Arial", size: CGFloat(60))
        label.textAlignment = NSTextAlignment.Center
        self.view.addSubview(label)
        
        let button = UIButton(frame: CGRect(x: widthUnit, y: heightUnit*6, width: widthUnit*6, height: heightUnit/2))
        button.layer.cornerRadius = CGFloat(10)
        button.layer.borderWidth = CGFloat(1)
        button.layer.borderColor = UIColor.whiteColor().CGColor
        button.setTitle("Login", forState: UIControlState.Normal)
        
        self.view.addSubview(button)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

