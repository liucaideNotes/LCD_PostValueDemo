//
//  ViewController.swift
//  LCD_PostValueDemo
//
//  Created by 刘才德 on 16/6/12.
//  Copyright © 2016年 iexbuy. All rights reserved.
//

import UIKit

class ViewController: UIViewController,MyDelegate {

    @IBOutlet weak var titleLab: UILabel!
    var isSingleton: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func closureBtn(sender: AnyObject) {
        // -- 1.闭包传值
        let vc = TwoVC.initVC()
        vc.type = .One
        vc.myClosures = {(text:String) in
            self.titleLab.text = text
        }
       self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func notificationBtn(sender: AnyObject) {
        // -- 2.通知传值 注册通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.postNoti(_:)), name:"postNotiOK", object: nil)
        let vc = TwoVC.initVC()
        vc.type = .Two
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func protocolBtn(sender: AnyObject) {
        // -- 3. 协议
        let vc = TwoVC.initVC()
        vc.type = .Three
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func singletonBtn(sender: AnyObject) {
        let vc = TwoVC.initVC()
        vc.type = .Four
        isSingleton = true
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    //MARK:---------- 2.通知传值
    func postNoti(notification:NSNotification) -> Void {
        
        let notifi:String = notification.object as! String
        titleLab.text = notifi
        
        // -- 销毁通知
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "postNotiOK", object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
   // -- 3.实现协议方法
    internal func backTo(message: String) {
        titleLab.text = message
    }
    
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        // -- 4.单例传值
        if isSingleton {
            titleLab.text = LCDSingleton.shared.myText
        }
    }
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

