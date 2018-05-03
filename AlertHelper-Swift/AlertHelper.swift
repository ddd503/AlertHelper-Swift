//
//  AlertHelper.swift
//  AlertHelper-Swift
//
//  Created by kawaharadai on 2018/05/03.
//  Copyright © 2018年 kawaharadai. All rights reserved.
//

import UIKit

protocol AlertHelperDelegate: class {
    func hogehoge()
}

class AlertHelper: NSObject {
    
    weak var delegate: AlertHelperDelegate?
    
    func alertWithProtocol(title: String?, messege: String?) -> UIAlertController {
        
        let alert = UIAlertController(title: title,
                                      message: messege,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.delegate?.hogehoge()
        }
        
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        return alert
    }
    
    /// クラスメソッドで用意(インスタンス化なしでいける)
    static func alertWithClosure(title: String?,
                          messege: String?,
                          handler: ((UIAlertAction) -> Void)?) -> UIAlertController {
        
        let alert = UIAlertController(title: title,
                                      message: messege,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: handler)
        
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        return alert
    }
}
