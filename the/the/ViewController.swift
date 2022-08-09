//
//  ViewController.swift
//  the
//
//  Created by ByteDance on 2022/6/10.
//

import UIKit
import SnapKit
 
class ViewController: UIViewController {
    
    let myalterView = MyAlterController(nibName: "View", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.present(myalterView, animated: true, completion: nil)
        view.addSubview(myalterView.view)
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }
 
}
