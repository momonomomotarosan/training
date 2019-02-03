//
//  PageViewController.swift
//  training
//
//  Created by 土井萌 on 2018/12/30.
//  Copyright © 2018年 土井萌. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers([getFirst()], direction: .forward, animated: true, completion: nil)
        self.dataSource = self
        // Do any additional setup after loading the view.
    }

    func getFirst() -> EnterScoreViewController {
        return storyboard!.instantiateViewController(withIdentifier: "EnterScoreViewController") as! EnterScoreViewController
    }
    
    func getSecond() -> EnterScore2ViewController {
        return storyboard!.instantiateViewController(withIdentifier: "EnterScore2ViewController") as! EnterScore2ViewController
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension PageViewController : UIPageViewControllerDataSource {
    
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        return nil
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        return nil
//    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if pageViewController.isKind(of: EnterScoreViewController.self) {
            // 1 -> 2
            return getSecond()
        } else {
            return getFirst()
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?  {
        if viewController.isKind(of: EnterScore2ViewController.self) {
            // 2 -> 1
            return getFirst()
        } else {
            // 1 -> end of the road
            return getSecond()
        }
    }
}
