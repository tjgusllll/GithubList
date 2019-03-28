//
//  ViewController.swift
//  GithubList
//
//  Created by 조서현 on 2019. 3. 27..
//  Copyright © 2019년 조서현. All rights reserved.
//

import UIKit
import Alamofire

struct User : Codable{

    var avatar_url : URL?
    var id : Int?
    var login : String?
//    var events_url : URL?
//    var followers_url : URL?
//    var following_url : URL?
//    var gists_url : URL?
//    var gravatar_id : String?
//    var html_url : URL?
//    var node_id : String?
//    var organizations_url : URL?
//    var received_events_url : URL?
//    var repos_url : URL?
//    var site_admin : Bool?
//    var starred_url : URL?
//    var subscriptions_url : URL?
//    var type : String?
//    var url : URL?

    
}

struct UserList : Codable {
    var users : [User]
}

let myurl: String = "https://api.github.com/users"
var userlist : [User] = [User]()



class ViewController: UIViewController {
    
    
    //MARK:- UI Properties
    var tableview: UITableView = {
        let tableview = UITableView(frame: .zero, style: .plain)
        tableview.register(ItemCell.self , forCellReuseIdentifier: "MyCell")
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
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
        
        LoadUserList()
        self.tableview.reloadData()
    }
    
    //MARK:- Get All Users
    func LoadUserList() {
        userlist.removeAll()
        Alamofire.request(myurl, method: .get, encoding: JSONEncoding.default, headers: nil).responseJSON() {
            response in
                    print(response.result.value!)
                   print("-------------------------------")
            let decoder = JSONDecoder()
            let data: Data? = response.data
            print(data!)
            
            //안넘어가는부분
            if let data = data, let myUser = try? decoder.decode(UserList.self, from: data) {
                print(myUser)
                print("-------------------------------2")
                
                var newUser = User()
                for user in myUser.users {
                    newUser.avatar_url = user.avatar_url!
                    newUser.id = user.id!
                    newUser.login = user.login!
                    userlist.append(newUser)
                }
                
                print(userlist.count)
            }
            print("-------------------------------3")
        }
    }
    
}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userlist.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! ItemCell
        //cell.userImage = userlist[indexPath.row].avatar_url
        cell.itemTitle.text = String(userlist[indexPath.row].id!)
        cell.itemDetail.text = userlist[indexPath.row].login
        
        //let url = URL(string:userlist[indexPath.row].avatar_url!)
        //if let data = try? Data(contentsOf: url!) {
//
//        if let data = try? Data(contentsOf: userlist[indexPath.row].avatar_url!) {
//            let image = UIImage(data: data)
//            cell.itemImageView.image = image}
//        cell.totalAmount = items[indexPath.row].itemAmount
//        cell.currentAmount = items[indexPath.row].itemCurrentAmount
        
        
        return cell
    }
}
