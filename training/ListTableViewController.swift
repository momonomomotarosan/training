//
//  ListTableViewController.swift
//  training
//
//  Created by 土井萌 on 2018/12/26.
//  Copyright © 2018年 土井萌. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    var DaysArray: [Dictionary<String, String>] = []
    let saveData = UserDefaults.standard
    let userDefaults = UserDefaults.standard
//    var GoalNumber: String?
//    var Number: String!

    func readData() -> String {
        // Keyを指定して読み込み
//        if userDefaults.object(forKey: "GOAL") == nil {
//            let str: String = "30"
//        } else {
//            let str: String = userDefaults.object(forKey: "GOAL") as! String
//        }
        let str: String = userDefaults.object(forKey: "GOAL") as! String
        return str
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Number = GoalNumber
        print(readData())
//        var exNumber = readData()
//        var EXNumber = Int(exNumber)
//        print(EXNumber)
//        if EXNumber! < 30 {
//            print("小さいよーー")
//        } else {
//            print("大きいよーー")
//        }
        
//        print(Number) 画面遷移の中の値写し失敗
        tableView.register(UINib(nibName: "ListTableViewCell", bundle: nil),forCellReuseIdentifier: "cell")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if saveData.array(forKey: "DAYS") != nil {
            DaysArray = saveData.array(forKey: "DAYS") as! [Dictionary<String, String>]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DaysArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListTableViewCell
        
        let nowIndexPathDictionary = DaysArray[indexPath.row]
        
        cell.DayLabel.text = nowIndexPathDictionary["day"]
        cell.ScoreLabel.text = nowIndexPathDictionary["score"]
        
        var RealNumber = nowIndexPathDictionary["score"]
        var nRealNumber = Int(RealNumber!)
        print(nRealNumber)
        var exNumber = readData()
        var EXNumber = Int(exNumber)
        print(EXNumber)
        if EXNumber! > nRealNumber! {
            cell.AlertLabel.text = "小さいよーー"
        } else if EXNumber! == nRealNumber! {
            cell.AlertLabel.text = "ぴった"
        } else {
            cell.AlertLabel.text = "大きいよーー"
        }
//        var Score = nowIndexPathDictionary["score"] as Int!
//
//        if Int(nowIndexPathDictionary["score"]!) => Number {
//
//        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        DaysArray.remove(at: indexPath.row)
        saveData.set(DaysArray, forKey: "DAYS")
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        
        //        wordArray.remove(at: indexPath.row)
        //        saveData.set(wordArray, forKey: "WORD")
        //        tableView.reloadData()
        
        return "削除"
    }


    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
