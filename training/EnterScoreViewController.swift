//
//  ListViewController.swift
//  training
//
//  Created by 土井萌 on 2018/12/26.
//  Copyright © 2018年 土井萌. All rights reserved.
//

import UIKit

class EnterScoreViewController: UIViewController {
    var exday:String = "でふぉ"
    
    let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var DatePicker: UIDatePicker!
    
    func dateChange(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日"
        let strDate = formatter.string(from: date)
        return strDate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let f = DateFormatter()
        f.dateFormat = "yyyy年MM月dd日"
        f.locale = Locale(identifier: "ja_JP")
        let 今日 = Date()
        DateLabel.text = String(f.string(from: 今日))
        exday = String(f.string(from: 今日))
        
        userDefaults.register(defaults: ["EXDAY": "defaults"])
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dateChange(_ sender: UIDatePicker) {
        DateLabel.text = self.dateChange(date: DatePicker.date)
        exday = self.dateChange(date: DatePicker.date)
        saveData(exday: exday)
        print(exday)
        print(readData())
    }
    
    func saveData(exday: String){
        // Keyを指定して保存
        userDefaults.set(exday, forKey: "EXDAY")
        userDefaults.synchronize()
        
    }
    
    func readData() -> String {
        // Keyを指定して読み込み
        let exday: String = userDefaults.object(forKey: "EXDAY") as! String
        return exday
    }
    
}
