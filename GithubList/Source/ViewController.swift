//
//  ViewController.swift
//  GithubList
//
//  Created by 조서현 on 2019. 3. 27..
//  Copyright © 2019년 조서현. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //MARK:- UI Properties
    var tableview: UITableView = {
        let tableview = UITableView(frame: .zero, style: .plain)
        tableview.register(ItemCell.self , forCellReuseIdentifier: "MyCell")
        return tableview
    }()
    
    //MARK:- SetupUI_TableView
    func setupUI() {
        self.tableview.dataSource = self
        self.tableview.delegate = self
        
        view.addSubview(tableview)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: tableview.topAnchor),
            self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: tableview.bottomAnchor),
            self.view.leadingAnchor.constraint(equalTo: tableview.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: tableview.trailingAnchor)
            ])
        
        print("setupUI_Tableview----fin")
       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        DispatchQueue.global().sync {
//
//        }
        LoadUserList(tableview)
        setupUI()
        
        DispatchQueue.main.async {
        self.tableview.reloadData()
        }
    }
}



extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! ItemCell
        print("----cellForRowAt")
        
//        cell.itemTitle.text = String(1)
//        cell.itemDetail.text = "mojombo"
//        let url = URL(string:"https://avatars0.githubusercontent.com/u/1?v=4")
//        if let data = try? Data(contentsOf: url!) {
//            let image = UIImage(data: data)
//            cell.itemImageView.image = image
//        }
        
        if let user_ava = userlist[indexPath.row].avatar_url,
            let user_id = userlist[indexPath.row].id,
            let user_login = userlist[indexPath.row].login {
            print("user_id : \(user_id)")
        cell.itemTitle.text = String(userlist[indexPath.row].id!)
        cell.itemDetail.text = userlist[indexPath.row].login
        
            cell.itemTitle.text = String(user_id)
            cell.itemDetail.text = user_login

            if let data = try? Data(contentsOf: user_ava) {
                let image = UIImage(data: data)
                cell.itemImageView.image = image
            }
            
        }
        
        return cell
    }
    
}
