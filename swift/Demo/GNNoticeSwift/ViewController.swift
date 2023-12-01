//
//  ViewController.swift
//  GNNoticeSwift
//
//  Created by naton_iOS on 2023/11/29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func showLoading(_ sender: Any) {
        self.view.gn.showLoadingView()
    }
    
    @IBAction func showNoData(_ sender: Any) {
        self.view.gn.showNoDataView()
    }
    
    @IBAction func showLoadFailed(_ sender: Any) {
//        self.view.gn.showNoNetView(self, action: #selector(self.showLoading), for: UIControl.Event.touchUpInside, centerOffset: CGPointMake(0, 100))
        self.view.gn.showNoNetView(self, action: #selector(self.showLoading), for: UIControl.Event.touchUpInside, centerOffset: CGPointMake(0, 0))
    }
    @IBAction func hidePlaceHolderView(_ sender: Any) {
        self.view.gn.hidePlaceHolderView()
    }
}

