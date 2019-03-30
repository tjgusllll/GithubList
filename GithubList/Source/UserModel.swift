//
//  UserModel.swift
//  GithubList
//
//  Created by 조서현 on 2019. 3. 29..
//  Copyright © 2019년 조서현. All rights reserved.
//

import Foundation
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


let myurl: String = "https://api.github.com/users"
var userlist : [User] = [User]()


//MARK:- Get All Users
    func LoadUserList(_ tableview : UITableView) {
    print("UserModel LoadUserList")
    userlist.removeAll()
    
    //responseData로 하면 굳이 데이터로 변환을 하지 않아도 된다.
    Alamofire.request(myurl, method: .get, encoding: JSONEncoding.default, headers: nil).responseData() { response in
        switch response.result {
        case .success(let data): //switch~case구문을 사용하여 response.result 하위의 success와 failure를 구분해준다.
            do {
                let myUser = try JSONDecoder().decode([User].self, from: data)
                var newUser = User()
                for user in myUser {
                    newUser.avatar_url = user.avatar_url
                    newUser.id = user.id
                    newUser.login = user.login
                    userlist.append(newUser)
                    DispatchQueue.main.async {
                        tableview.reloadData()
                    }
                }
                print(userlist.count)
                print("LoadUserList----fin")
            } catch {
                print("Decode 실패")
                
            }
        case.failure(let error):
            print(error.localizedDescription)
        }
    }
}

