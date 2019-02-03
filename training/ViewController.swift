//
//  ViewController.swift
//  training
//
//  Created by 土井萌 on 2018/12/25.
//  Copyright © 2018年 土井萌. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let saveData = UserDefaults.standard
    let userDefaults = UserDefaults.standard
    var ProjectArray: [Dictionary<String, String>] = []
    
    func saveData(str: String) {
        // Keyを指定して保存
        userDefaults.set(str, forKey: "GOAL")
        userDefaults.synchronize()
    }
    
    func readData() -> String {
        // Keyを指定して読み込み
        let str: String = userDefaults.object(forKey: "GOAL") as! String
        return str
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let GoalFirstNumber = "30"
//        saveData(str: GoalFirstNumber)
        if userDefaults.object(forKey: "GOAL") == nil {
            let GoalFirstNumber = "30"
            saveData(str: GoalFirstNumber)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
