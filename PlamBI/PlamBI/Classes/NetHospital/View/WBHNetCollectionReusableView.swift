//
//  WBHNetCollectionReusableView.swift
//  PlamBI
//
//  Created by hjy on 2017/11/16.
//  Copyright © 2017年 hjy. All rights reserved.
//

import UIKit

class WBHNetCollectionReusableView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        //背景图片
        let backGroundImageView = UIImageView.init()
        backGroundImageView.image = UIImage.init(named: "banner_01")
        backGroundImageView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        self.addSubview(backGroundImageView)
       
        //今日数据label
        let currentDataLabel = self.createLabel(titleString:"今日数据", titleFont: 12.0, titleColor: "ffdf03")
        currentDataLabel.frame = CGRect(x: 15, y: 40, width: 80, height: 20)
        self.addSubview(currentDataLabel)
        
        //时间
        let currentDateLabel = self.createLabel(titleString: "2017.11.16", titleFont: 12, titleColor: "ffffff")
        currentDateLabel.frame = CGRect(x: currentDataLabel.frame.minX, y: currentDataLabel.frame.midY + 10.0, width: currentDataLabel.frame.width, height: currentDataLabel.frame.height)
        self.addSubview(currentDateLabel)
        
        //药房处方
        let circleView =  WBHCircleCustomView.init(frame: CGRect(x: 0, y: 0, width: screenWidth / 3, height: screenWidth / 3))
        circleView.backgroundColor = UIColor.clear
        circleView.center = CGPoint(x: self.center.x, y: self.center.y)
        circleView.layer.cornerRadius = circleView.frame.size.width / 2
        circleView.layer.masksToBounds = true
        self.addSubview(circleView);
        
    }
    
    private func createLabel(titleString title:String,titleFont font:CGFloat ,titleColor color:String) -> UILabel {
        let label = UILabel.init()
        label.text = title
        label.font = UIFont.systemFont(ofSize: font)
        label.textColor = WBHTools.colorWithHexString(hexString: color)
        return label
    }
  
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
