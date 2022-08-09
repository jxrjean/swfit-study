//
//  TableViewController.swift
//  tableviewdemo
//
//  Created by ByteDance on 2022/6/16.
//

import UIKit
import SnapKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    typealias listItem = (String, ()->UIViewController)
    
    private var titleLabel = UILabel()
    private var tableView = UITableView()
    
    var dataSource: [listItem] = [
        listItem("ScrollView", { ScrollViewController() })
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ItemCell.self, forCellReuseIdentifier: "ItemCell")
        
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.size.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        
        view.backgroundColor = .white
        titleLabel.text = "应用导航"
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.title = dataSource[indexPath.row].0
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = dataSource[indexPath.row].1
        self.navigationController?.pushViewController(vc(), animated: true)
        
    }
    
}
