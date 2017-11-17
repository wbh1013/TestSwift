//
//  WBHTabBarController.swift
//  PlamBI
//
//  Created by hjy on 2017/9/6.
//  Copyright © 2017年 hjy. All rights reserved.
//

import UIKit

class WBHTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = WBHTools.colorWithHexString(hexString: "f7f7f7")
        //设置tabbbar
        self.setTabbar()
        //添加控制器
        self.addChildVC()
    }
    
    private func setTabbar(){
        //设置默认的数据
        let dictNomal = NSDictionary.init(objects: [WBHTools.colorWithHexString(hexString: "9a9795"),UIFont.systemFont(ofSize: 12)], forKeys: [NSAttributedStringKey.foregroundColor as NSCopying,NSAttributedStringKey.font as NSCopying])
        UITabBarItem.appearance().setTitleTextAttributes(dictNomal as? [NSAttributedStringKey : Any], for: UIControlState.normal)
        //设置选中的数据
        let dictSelect = NSDictionary.init(objects: [WBHTools.colorWithHexString(hexString: "22c5c0"),UIFont.systemFont(ofSize: 12)], forKeys: [NSAttributedStringKey.foregroundColor as NSCopying,NSAttributedStringKey.font as NSCopying])
        UITabBarItem.appearance().setTitleTextAttributes(dictSelect as? [NSAttributedStringKey : Any], for: UIControlState.selected)
        UITabBar.appearance().barTintColor = UIColor.white
        UITabBar.appearance().isTranslucent = false
        
    }
    private func addChildVC(){
        self.createChildViewController(controller: WBHNetHospitalController(),    title: "网络医院", nomalImage: "hospital_icon_normal", selectImage: "hospital_icon_select")
        self.createChildViewController(controller: WBHHealthPlatformController(), title: "健康平台", nomalImage: "heath_icon_normal",    selectImage: "heath_icon_select")
        self.createChildViewController(controller: WBHSettingController(),        title: "设置",    nomalImage: "s_icon_normal",        selectImage: "s_icon_select")
    }
    
    private func createChildViewController(controller:UIViewController,title:String,nomalImage:String,selectImage:String){
        let nav = WBHNavigationController.init(rootViewController: controller)
        nav.jz_fullScreenInteractivePopGestureEnabled = true
        self.addChildViewController(nav)
        nav.tabBarItem.title = title;
        nav.tabBarItem.image = UIImage.init(named: nomalImage)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        nav.tabBarItem.selectedImage = UIImage.init(named: selectImage)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
    }
   

}
