//
//  viewdemoViewController.swift
//  firstapp
//
//  Created by ByteDance on 2022/6/10.
//

import UIKit

class viewdemoViewController: UIViewController {
    
    private let viewA: UIView = UIView()
    private let buttonA: UIButton = UIButton(type: UIButton.ButtonType.infoLight)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewA.backgroundColor = #colorLiteral(red: 0, green: 0.46, blue: 0.89, alpha: 1)
        view.addSubview(viewA)
        
        
        //按钮
        buttonA.addTarget(self, action: #selector(buttonClicked(button:)), for: UIControl.Event.touchUpInside)
        view.addSubview(buttonA)
        
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewA.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: 400, height: 400)
        buttonA.frame = CGRect(x: 100, y: view.safeAreaInsets.top + 450 , width: 40, height: 40)
    }

    @objc private func buttonClicked(button: UIButton) {
        print(#function)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
