//
//  WBHNetHospitalController.swift
//  PlamBI
//
//  Created by hjy on 2017/9/6.
//  Copyright © 2017年 hjy. All rights reserved.
//

import UIKit

//let screenWidth  = UIScreen.main.bounds.size.width
//let screenHeight = UIScreen.main.bounds.size.height

class WBHNetHospitalController: UIViewController ,UICollectionViewDataSource,UICollectionViewDelegate{
    
    // MAEK - SHEN
    let cellID:String         = "HomeCellID"
    let NetHeaderSectionID: String = "homecCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false;
        //隐藏导航栏
        self.jz_wantsNavigationBarVisible = false;
        self.view.addSubview(self.collection)
       
    }
    
//MARK -  UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! WBHNetHospitalCell
        cell.nameString = self.dataArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier:NetHeaderSectionID , for: indexPath)
            return headerView
        }else{
            return UICollectionReusableView()
        }
    }
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! WBHNetHospitalCell
        //设置cell选择时的颜色
        cell.contentView.backgroundColor = WBHTools.colorWithHexString(hexString: "#708090")
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! WBHNetHospitalCell
        //恢复颜色
        cell.contentView.backgroundColor = WBHTools.colorWithHexString(hexString: "#ffffff")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
         case 0:
            let view0 = UIViewController()
            view0.view.backgroundColor = UIColor.white
            view0.jz_wantsNavigationBarVisible = true
            self.navigationController?.pushViewController(view0, animated: true)
            break
         case 1:
            
            break
         case 2:
            break
         case 3:
            break
         case 4:
            break
         case 5:
            break
         case 6:
            break
         case 7:
            break
         case 8:
            break
         case 9:
            break
        default:
            break
            
        }
    }
    
    @objc private func testBtnClick(btn:UIButton)  {

    }
    
//MARK - 懒加载
    //懒加载UICollectionViewFlowLayout
    lazy var flowLayout:UICollectionViewFlowLayout = {
        let tempFlowLayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        let spacing:CGFloat = 1.0
        //设置最小间距
        tempFlowLayout.minimumLineSpacing = spacing
        //设置列间距
        tempFlowLayout.minimumInteritemSpacing = spacing
        tempFlowLayout.itemSize = CGSize(width: (screenWidth - 2.0 * spacing) / 3.0, height: (screenWidth - 2.0 * spacing) / 3.0)
        tempFlowLayout.scrollDirection = UICollectionViewScrollDirection.vertical
        tempFlowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        tempFlowLayout.headerReferenceSize = CGSize(width: screenWidth, height: screenWidth * 0.6)
        return tempFlowLayout
    }()
    
    //懒加载UICollectionView
    lazy var collection:UICollectionView = {
        let tempCollection:UICollectionView = UICollectionView(frame: CGRect.init(x: 0, y: 0, width:screenWidth , height:  screenHeight - 49), collectionViewLayout: self.flowLayout)
        tempCollection.delegate   = self
        tempCollection.dataSource = self
        tempCollection.backgroundColor = WBHTools.colorWithHexString(hexString: "f7f7f7")
        tempCollection.delaysContentTouches = false
        tempCollection.showsVerticalScrollIndicator = false
        //注册
        tempCollection.register(WBHNetHospitalCell.self, forCellWithReuseIdentifier: cellID)
        tempCollection.register(WBHNetCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: NetHeaderSectionID)
        
        return tempCollection
    }()
    
    //懒加载数据
    lazy var dataArray:[String] = {
       return ["图文咨询","视频咨询","服务订单","健康屋","药房处方","智慧处方","注册医生","注册用户","预约挂号"]
    }()
  
}
