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
}

struct UserList : Codable {
    var users : [User]
}

class ViewController: UIViewController {
    let url = "https://api.github.com/users"
    var userlist : [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadUserList()
    }
    
    func LoadUserList() {
        self.userlist.removeAll()
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default, headers: nil).responseJSON() {
            response in
            print(response.result.value!)
            print("-------------------------------")
            
        }
        
    }
    
}
