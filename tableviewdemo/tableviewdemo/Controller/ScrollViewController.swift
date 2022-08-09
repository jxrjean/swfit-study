//
//  ScrollViewController.swift
//  tableviewdemo
//
//  Created by ByteDance on 2022/6/16.
//

import UIKit

class ScrollViewController: UIViewController, UIScrollViewDelegate{
        
        var myScrollView: UIScrollView!

        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            // 建立 UIScrollView
            myScrollView = UIScrollView()
            
            
            // 是否顯示水平的滑動條
            myScrollView.showsHorizontalScrollIndicator = true
            
            // 是否顯示垂直的滑動條
            myScrollView.showsVerticalScrollIndicator = false
            
            // 滑動條的樣式
            myScrollView.indicatorStyle = .black
            
            // 是否可以滑動
            myScrollView.isScrollEnabled = true
            
            // 是否可以按狀態列回到最上方
            myScrollView.scrollsToTop = false
            
            // 限制滑動時只能單個方向 垂直或水平滑動
            myScrollView.isDirectionalLockEnabled = false
            
            // 滑動超過範圍時是否使用彈回效果
            myScrollView.bounces = true
            
            // 縮放元件的預設縮放大小
            myScrollView.zoomScale = 1.0

            // 縮放元件可縮小到的最小倍數
            myScrollView.minimumZoomScale = 0.5
            
            // 縮放元件可放大到的最大倍數
            myScrollView.maximumZoomScale = 2.0

            // 縮放元件縮放時是否在超過縮放倍數後使用彈回效果
            myScrollView.bouncesZoom = true

            // 設置委任對象
            myScrollView.delegate = self

            // 起始的可見視圖偏移量 預設為 (0, 0)
            // 設定這個值後 就會將原點滑動至這個點起始
            //myScrollView.contentOffset = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.5)
            
            // 以一頁為單位滑動
            myScrollView.isPagingEnabled = true
            

            // 加入到畫面中
            self.view.addSubview(myScrollView)
            
            myScrollView.snp.makeConstraints { make in
                make.top.equalTo(view.snp.top)
                make.left.equalTo(view.snp.left)
                make.width.equalTo(view.snp.width)
                make.height.equalTo(view.snp.height)
                
            }

            let horizontalStackView = UIStackView()
            horizontalStackView.axis = .horizontal
            myScrollView.addSubview(horizontalStackView)
            horizontalStackView.snp.makeConstraints { make in
                make.left.top.bottom.right.height.equalToSuperview()
                make.width.equalToSuperview().multipliedBy(3)
            }
            var curRigth = myScrollView.snp.left
            // 建立3個 UIView 來協助顯示出滑動的路徑
            for i in 0...2 {
                let myUIView = UIView()
                horizontalStackView.addSubview(myUIView)
                let textLabel = UILabel()
                textLabel.text = "这是第\(i)页"
                myUIView.addSubview(textLabel)
                myUIView.snp.makeConstraints { make in
                    make.left.equalTo(curRigth)
                    make.top.equalToSuperview()
                    make.width.equalTo(view.snp.width)
                    make.height.equalTo(view.snp.height)
                }
                curRigth = myUIView.snp.right
                
                textLabel.snp.makeConstraints { make in
                    make.bottom.equalTo(myUIView.snp.bottom).offset(-40)
                    make.centerX.equalToSuperview()
                }
            }
            
        }
        
        // 開始滑動時
        func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
            print("scrollViewWillBeginDragging")
        }
        
        // 滑動時
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            //print("scrollViewDidScroll")
        }
        
        // 結束滑動時
        func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
            print("scrollViewDidEndDragging")
        }
        
}
