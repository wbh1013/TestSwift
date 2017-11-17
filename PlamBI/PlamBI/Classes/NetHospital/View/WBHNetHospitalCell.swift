//
//  WBHNetHospitalCell.swift
//  PlamBI
//
//  Created by hjy on 2017/11/16.
//  Copyright © 2017年 hjy. All rights reserved.
//

import UIKit

class WBHNetHospitalCell: UICollectionViewCell {

    private var iconImageView:UIImageView? = nil
    private var nameLabel:UILabel?         = nil

    
    public var nameString:String {
        didSet{
            iconImageView?.image = UIImage.init(named: nameString)
            nameLabel?.text = nameString
        }
    }

    override init(frame: CGRect) {
        nameString = ""
        super.init(frame: frame)
        //设置背景色
        self.contentView.backgroundColor = UIColor.white
        //创建imageview
        let iconImageWidth  = frame.size.width / 2
        let iconImageHeight = iconImageWidth
        iconImageView = UIImageView.init()
        iconImageView?.frame = CGRect(x: (frame.size.width - iconImageWidth ) / 2, y: 20, width: iconImageWidth, height: iconImageHeight)
        self.contentView.addSubview(iconImageView!)
        
        //创建label
        nameLabel = UILabel.init()
        nameLabel?.frame = CGRect(x: 0, y: (iconImageView?.frame.maxY)! + 10.0 , width: frame.size.width, height: 20)
       
        nameLabel?.textColor = WBHTools.colorWithHexString(hexString: "333333")
        nameLabel?.textAlignment = NSTextAlignment.center
        self.contentView.addSubview(nameLabel!)
    }
    
 
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
