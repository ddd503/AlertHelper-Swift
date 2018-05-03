//
//  ViewController.swift
//  AlertHelper-Swift
//
//  Created by kawaharadai on 2018/05/03.
//  Copyright © 2018年 kawaharadai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let alertHelper = AlertHelper()
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // デリゲートを準拠
        alertHelper.delegate = self
    }
    
    // MARK: - Action
    @IBAction func protocolAlert(_ sender: Any) {
        let alert = alertHelper.alertWithProtocol(title: "アラート", messege: "プロトコルでアクションを実行します。")
        self.present(alert, animated: true)
    }
    
    @IBAction func closureAlert(_ sender: Any) {
        let alert = AlertHelper.alertWithClosure(title: "アラート",
                                                 messege: "クロージャでアクションを実行します。") { _ in
                                                    
                                                    self.hoge()
        }
        self.present(alert, animated: true)
    }
    
    // MARK: - Private
    private func hoge() {
        print("クロージャでアクション実行")
    }
}

// MARK: - AlertHelperDelegate
extension ViewController: AlertHelperDelegate {
    func hogehoge() {
        print("プロトコルでアクション実行")
    }
}
