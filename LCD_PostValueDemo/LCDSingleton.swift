//
//  LCDSingleton.swift
//  IEXBUY
//
//  Created by sifenzi on 16/4/26.
//  Copyright © 2016年 IEXBUY. All rights reserved.
//

import Foundation



public class LCDSingleton {
    private static let sharedInstance = LCDSingleton()
    private init() {}
    //提供静态访问方法
    public static var shared: LCDSingleton {
        return self.sharedInstance
    }
    
    // —— 存储值
    var myText:String = ""
    
}


