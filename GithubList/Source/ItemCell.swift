//
//  ItemCell.swift
//  GithubList
//
//  Created by 조서현 on 2019. 3. 27..
//  Copyright © 2019년 조서현. All rights reserved.
//

import UIKit

final class ItemCell: UITableViewCell {
    
    //MARK:- Constant
    
    //하나의 class에서 사용하는 상수나, 공통적인 부분을 Constant 구조체를 만들어 묶어준다.
    struct Constant {
        static let basicMargin: CGFloat = 20
        static let itemImageSize: CGFloat = 100
        static let addButtonSize: CGFloat = 50
    }
    
    //MARK:- UI Properties
    
    //Cell그릴때 테두리도 만들어주기
    let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let itemTitle: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let itemDetail: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    //MARK:- Initialize
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("----ItemCell SetupUI")
        setupUI()
    }
    
    //class에서 초기화 메소드를 구현할떄에는 반드시 required를 붙여야한다.
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(itemImageView)
        addSubview(itemTitle)
        addSubview(itemDetail)
        
        print("ItemCell setupUI")
        
        //itemImage
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        itemImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        itemImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.basicMargin).isActive = true
        itemImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        //imageview,view는 intrinsic size가 없으므로 크기를 잡아줘야한다
        itemImageView.widthAnchor.constraint(equalToConstant: Constant.itemImageSize).isActive = true
        itemImageView.heightAnchor.constraint(equalToConstant: Constant.itemImageSize).isActive = true
        
        
        //itemTitle
        itemTitle.translatesAutoresizingMaskIntoConstraints = false
        itemTitle.topAnchor.constraint(equalTo: topAnchor, constant: Constant.basicMargin).isActive = true
        itemTitle.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: Constant.basicMargin).isActive = true
        
        //itemDetail
        itemDetail.translatesAutoresizingMaskIntoConstraints = false
        //itemDetail.centerXAnchor.constraint(equalTo: itemTitle.centerXAnchor).isActive = true
        itemDetail.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: Constant.basicMargin).isActive = true
        itemDetail.topAnchor.constraint(equalTo: itemTitle.bottomAnchor, constant: (Constant.basicMargin / 2)).isActive = true
        
    }
}
