//
//  WBHCircleCustomView.swift
//  PlamBI
//
//  Created by hjy on 2017/11/17.
//  Copyright © 2017年 hjy. All rights reserved.
//

import UIKit

class WBHCircleCustomView: UIImageView {
    public var   dataLael:UILabel? = nil
    public var   dataNameLabel:UILabel? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
         self.createUI()
    }
//MARK - 创建UI
    private func createUI(){
        self.image = UIImage.init(named: "headerCircle")
        //展示数据的label
        dataLael = self.createLabel(titleString: "108", titleFont: 50, titleColor: "ffffff")
        dataLael?.frame = CGRect(x:  (self.frame.size.width - (self.frame.size.width - 30 - 5 )) / 2, y: 5, width: self.frame.size.width - 30 - 5, height: self.frame.size.height - 30 - 5)
        dataLael?.numberOfLines = 1
        self.addSubview(dataLael!)
        
        //药房处方
        dataNameLabel = self.createLabel(titleString: "药房处方", titleFont: 20, titleColor: "ffffff")
        dataNameLabel?.frame = CGRect(x: 5, y: (dataLael?.frame.maxY)! - 10, width: self.frame.size.width - 10, height: 20)
        self.addSubview(dataNameLabel!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createLabel(titleString title:String,titleFont font:CGFloat ,titleColor color:String) -> UILabel {
        let label = UILabel.init()
        label.textAlignment = NSTextAlignment.center
        label.text = title
        label.font = UIFont.boldSystemFont(ofSize: font)
        label.textColor = WBHTools.colorWithHexString(hexString: color)
        label.adjustsFontSizeToFitWidth = true
        return label
    }
    
}
