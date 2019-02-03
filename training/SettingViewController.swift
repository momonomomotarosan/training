//
//  SettingViewController.swift
//  training
//
//  Created by 土井萌 on 2018/12/27.
//  Copyright © 2018年 土井萌. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet var GoalpickerView:UIPickerView!
    var GoalNumber:String = "30"
    
//    var Number = "30" 画面遷移の中の値写し失敗 at 2018 Xmas camp
    let dataList = ["10","20","30","40","50","60","70","80","90","100","110","120"]
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let ListTableViewController:ListTableViewController = segue.destination as! ListTableViewController
//    }
    
    let userDefaults = UserDefaults.standard

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UIPickerViewの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // UIPickerViewの行数、要素の全数
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return dataList.count
    }
    
    // UIPickerViewに表示する配列
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataList[row]
    }
    
    func saveData(str: String){
        
        // Keyを指定して保存
        userDefaults.set(str, forKey: "GOAL")
        userDefaults.synchronize()
        
    }
    
    func readData() -> String {
        // Keyを指定して読み込み
        let str: String = userDefaults.object(forKey: "GOAL") as! String
        return str
    }
    
    // UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        GoalNumber = String(dataList[row])
        saveData(str: GoalNumber)
        print(GoalNumber)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GoalpickerView.delegate = self
        GoalpickerView.dataSource = self
        
        userDefaults.register(defaults: ["GOAL": "defaults"])
        // Do any additional setup after loading the view.
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let ListTableViewController:ListTableViewController = segue.destination as! ListTableViewController
//        ListTableViewController.Number = GoalNumber
//        print(Number)
//    } 画面遷移の中の値写し失敗
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
