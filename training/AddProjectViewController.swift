//
//  AddProjectViewController.swift
//  training
//
//  Created by 土井萌 on 2018/12/29.
//  Copyright © 2018年 土井萌. All rights reserved.
//

import UIKit

class AddProjectViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var TextField: UITextField!
    @IBOutlet var PickerView: UIPickerView!
    var strprojectScore: String = "10"
    var ProjectArray: [Dictionary<String,String>] = []
    let saveData = UserDefaults.standard
//    let userDefaults = UserDefaults.standard
    
    let dataList = ["5","10","15","20","25","30"]

    override func viewDidLoad() {
        super.viewDidLoad()

        PickerView.delegate = self
        PickerView.dataSource = self
        
        print(ProjectArray)
        if saveData.array(forKey: "PRO") != nil {
            ProjectArray = saveData.array(forKey: "PRO") as! [Dictionary<String, String>]
        } //これ書いてないと一回分の処理しか表示されない
    }

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
    
    // UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        strprojectScore = String(dataList[row])
        print(strprojectScore)
    }
    
    @IBAction func addButton() {
        if TextField.text == "" {
            let title = "failed"
            let message = "Please add the name of project"
            let oktext = "OK"
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
            let okkayButton = UIAlertAction(title: oktext, style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(okkayButton)
            
            present(alert, animated: true, completion: nil)
        } else {
            let title = "success"
            let message = "we could serve the project"
            let oktext = "OK"
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
            let okkayButton = UIAlertAction(title: oktext, style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(okkayButton)
            
            present(alert, animated: true, completion: nil)
            
            let ProjectDictionary = ["name": TextField.text!, "proscore": strprojectScore]
            
            ProjectArray.append(ProjectDictionary)
            saveData.set(ProjectArray, forKey: "PRO")
        }
        
        TextField.text = ""
        
        //debug
//        let dic:[Dictionary<String,String>] = saveData.array(forKey: "PRO") as! [Dictionary<String, String>]
//        print("savedata: \(dic)")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
