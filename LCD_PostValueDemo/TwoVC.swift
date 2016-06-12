//
//  TwoVC.swift
//  LCD_PostValueDemo
//
//  Created by 刘才德 on 16/6/12.
//  Copyright © 2016年 iexbuy. All rights reserved.
//

import UIKit
enum PostType {
    case One
    case Two
    case Three
    case Four
    
}


protocol MyDelegate{
    func backTo(message : String)
}

class TwoVC: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var type:PostType = .One
    
    // -- 1.声明闭包
    var myClosures: ((text: String) -> Void)?
    // -- 3.声明代理
    var delegate: MyDelegate?

    class func initVC() -> TwoVC {
        return TwoVC(nibName: "TwoVC", bundle: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func popBtn(sender: AnyObject) {
        
        switch type {
        case .One:
            // -- 1.传递（闭包）
           myClosures?(text: textField.text!)
            
        case .Two:
            // -- 2.发送通知
            NSNotificationCenter.defaultCenter().postNotificationName("postNotiOK", object: textField.text!)
            
        case .Three:
            if((delegate) != nil){
                self.delegate?.backTo(textField.text!)
            }
            
        case .Four:
            LCDSingleton.shared.myText = textField.text!
            
        }
        
        
        self.navigationController?.popViewControllerAnimated(true)
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
