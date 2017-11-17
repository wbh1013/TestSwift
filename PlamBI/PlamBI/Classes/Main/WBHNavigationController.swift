//
//  WBHNavigationController.swift
//  PlamBI
//
//  Created by hjy on 2017/9/6.
//  Copyright © 2017年 hjy. All rights reserved.
//

import UIKit

class WBHNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.settingNav()
        
    }
    
    private func settingNav(){
        let dict = NSMutableDictionary()
        dict[NSAttributedStringKey.foregroundColor] = UIColor.white
        self.navigationBar.titleTextAttributes = dict as? [NSAttributedStringKey : Any];
        
        self.navigationBar.setBackgroundImage(WBHTools.createImageWithCorlor(color: WBHTools.colorWithHexString(hexString: "22c5c0")), for: UIBarMetrics.default)
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
       
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true;
            let custom = UIButton(type: UIButtonType.custom)
            custom.setImage(UIImage.init(named: "back_icon_white"), for: UIControlState.normal)
            custom.setImage(UIImage.init(named: "back_icon_white"), for: UIControlState.highlighted)
            custom.bounds = CGRect(x: 0, y: 0, width: 60, height: 40);
            custom.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
            custom.addTarget(self, action: #selector(WBHNavigationController.backButtonClick(btn:)), for: UIControlEvents.touchUpInside)
            let backBarItemBtn =  UIBarButtonItem(customView: custom)
            viewController.navigationItem.leftBarButtonItem = backBarItemBtn
        }
         super.pushViewController(viewController, animated: animated)
    }

    @objc func backButtonClick(btn:UIButton) {
        self.popViewController(animated: true)
    }

}
