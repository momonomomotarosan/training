//
//  EnterScore2ViewController.swift
//  training
//
//  Created by 土井萌 on 2018/12/30.
//  Copyright © 2018年 土井萌. All rights reserved.
//

import UIKit

class EnterScore2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var score: Int = 0
    
    var DaysArray: [Dictionary<String,String>] = []
    var ProjectArray: [Dictionary<String,String>] = []
    let saveData = UserDefaults.standard
    let userDefaults = UserDefaults.standard
    
    @IBOutlet var NumberLabel: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet var TableView: UITableView!
    
    var btnFlag1: Bool = false
    var btnFlag2: Bool = false
    var btnFlag3: Bool = false
    var btnFlag4: Bool = false
    
    //    @IBAction func changeDate(_ sender: UIPickerView) {
    //        let formatter = DateFormatter()
    //        formatter.dateFormat = "yyyy年MM月dd日"
    //        DateLabel.text = formatter.string(from: sender.date)
    //    }
    
    //    @IBAction func getDate(_ sender: Any) {
    //        DateLabel.text = "\(DatePicker.date)"
    //    }
    
    @IBAction func Button1() {
        if btnFlag1 == false {
            score = score + 5
            btnFlag1 = true
        } else {
            score = score - 5
            btnFlag1 = false
        }
        NumberLabel.text = String(score)
    }
    
    @IBAction func Button2() {
        if btnFlag2 == false {
            score = score + 10
            btnFlag2 = true
        } else {
            score = score - 10
            btnFlag2 = false
        }
        NumberLabel.text = String(score)
    }
    
    @IBAction func Button3() {
        if btnFlag3 == false {
            score = score + 15
            btnFlag3 = true
        } else {
            score = score - 15
            btnFlag3 = false
        }
        NumberLabel.text = String(score)
    }
    
    @IBAction func Button4() {
        if btnFlag4 == false {
            score = score + 20
            btnFlag4 = true
        } else {
            score = score - 20
            btnFlag4 = false
        }
        NumberLabel.text = String(score)
    }
    
    //    ProjectScorecell.accessoryType = .detailDisclosureButton
    //    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
    //        doSomethingWithItem(indexPath.row)
    //    } cellのbutton動かそうとして書いた buttonへのidentifierの付け方がわからなくて断念
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DateLabel.text = readData()
        NumberLabel.text = "0"
        
        if saveData.array(forKey: "DAYS") != nil {
            DaysArray = saveData.array(forKey: "DAYS") as! [Dictionary<String, String>]
        }
        
        TableView.register(UINib(nibName: "ProjectScoreTableViewCell", bundle: nil),forCellReuseIdentifier: "ProjectScorecell")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if saveData.array(forKey: "PRO") != nil {
            ProjectArray = saveData.array(forKey: "PRO") as! [Dictionary<String,String>]
        }
        TableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func AddButton() {
        let title = "success"
        let message = "we could serve the plan"
        let oktext = "OK"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let okkayButton = UIAlertAction(title: oktext, style: UIAlertActionStyle.cancel, handler: nil)
        alert.addAction(okkayButton)
        
        present(alert, animated: true, completion: nil)
        
        let DaysDictionary = ["day": DateLabel.text!, "score": NumberLabel.text!]
        
        DaysArray.append(DaysDictionary)
        saveData.set(DaysArray, forKey: "DAYS")
        
        //debug
        let dic:[Dictionary<String,String>] = saveData.array(forKey: "DAYS") as! [Dictionary<String, String>]
        print("savedata: \(dic)")
    }
    
    func readData() -> String {
        // Keyを指定して読み込み
        let exday: String = userDefaults.object(forKey: "EXDAY") as! String
        return exday
    }
    
    //sectionの数を指定
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //8月キャンプにて　上記 numberOfSections にerrorが出た時はdelegateとdatesourceをviewじゃなくてviewcontrollerに繋げることで解決
    
    //cellの個数=情報の個数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print("numberOfRowsInsection: \(planArray.count)")
        return ProjectArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ProjectScorecell = tableView.dequeueReusableCell(withIdentifier: "ProjectScorecell", for: indexPath) as! ProjectScoreTableViewCell
        
        let nowIndexPathDictionary = ProjectArray[indexPath.row]
        //print(nowIndexPathDictionary["name"])
        
        ProjectScorecell.NameLabel.text = nowIndexPathDictionary["name"]
        ProjectScorecell.ScoreLabel.text = nowIndexPathDictionary["proscore"]
        
        //        if let lbl = ProjectScorecell?.contentView.viewWithTag(1) as? UILabel {
        //            lbl.text = "item-\(1)"
        //        }
        //        if let btnChk = ProjectScorecell?.contentView.viewWithTag(2) as? UIButton {
        //            btnChk.addTarget(self, action: #selector(checkboxClicked(_ :)), for: .touchUpInside)
        //        } 何書いてんのかわからん
        
        //        let button = UIButton()
        //        button.backgroundColor = UIColor.blue
        //        button.setTitle("prees button", for: .normal)
        //        ProjectScorecell.contentView.addSubview(button)
        //        button.translatesAutoresizingMaskIntoConstraints = false
        //        ProjectScorecell.contentView.rightAnchor.constraint(equalTo: button.rightAnchor, constant: 10).isActive = true
        //        // 中央にする
        //        button.centerYAnchor.constraint(equalTo: ProjectScorecell.centerYAnchor).isActive = true
        // 青くてキモ目のbuttonは実装できるけどそれぞれの、、みたいなカードの書き方がわかんない
        return ProjectScorecell
    }
    
    //    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    //        ProjectArray.remove(at: indexPath.row)
    //        saveData.set(ProjectArray, forKey: "PRO")
    //        TableView.reloadData()
    //    }
    //
    //    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    //        return true
    //    }
    //
    //    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
    //        return "削除"
    //    }  削除機能はなくていいい
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    @objc func checkboxClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
}

class CheckBox: UIButton {
    let checkedImage = UIImage(named: "check_on")! as UIImage
    let uncheckedImage = UIImage(named: "check_off")! as UIImage
    
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.setImage(checkedImage, for: UIControlState.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControlState.normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControlEvents.touchUpInside)
        self.isChecked = false
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}
