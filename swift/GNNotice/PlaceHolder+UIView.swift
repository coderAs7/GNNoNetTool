//
//  GNNoticeExtension.swift
//  GNNoticeSwift
//
//  Created by naton_iOS on 2023/11/29.
//

import Foundation
import UIKit


private struct Container {
    static var currentShowView: Void? // "key"
}


public final class GNUtils<Base> {
    
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
    
}

public protocol GNUtilsCompatiable {
    
    associatedtype CompatiableType
    var gn: CompatiableType { get }
    static var gnClass: CompatiableType.Type { get }
}

public extension GNUtilsCompatiable {
    
    var gn: GNUtils<Self> {
        return GNUtils(self)
    }
    static var gnClass: GNUtils<Self>.Type {
        return GNUtils<Self>.self
    }
}

extension UIView: GNUtilsCompatiable {}

extension GNUtils where Base: UIView {
    public func hidePlaceHolderView(){
        let view : UIView? = self.getAssociatedView()
        view?.removeFromSuperview()
        self.setAssociatedView(view: nil)
    }
    
    private func getAssociatedView() -> UIView? {
        withUnsafePointer(to: &Container.currentShowView) {
            return objc_getAssociatedObject(self.base,$0) as? UIView
        }
    }
    
    private func setAssociatedView(view:UIView?) {
        objc_setAssociatedObject(self.base, &Container.currentShowView, view, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
    }
    
    private func showView(view:UIView, atIndex index:Int){
        self.hidePlaceHolderView()
        self.setAssociatedView(view: view)
        if index < 0 {
            self.base.addSubview(view)
        }else{
            self.base.insertSubview(view, at: index)
        }
    }
}


extension GNUtils where Base: UIView {
    func showLoadingView() {
        self.showLoadingView(centerOffset: CGPointZero, atIndex: -1)
    }
    func showLoadingView(atIndex index:Int) {
        self.showLoadingView(centerOffset: CGPointZero, atIndex:index)
    }
    
    func showLoadingView(centerOffset offset:CGPoint) {
        self.showLoadingView(centerOffset: offset, atIndex: -1)
    }
    
    func showLoadingView(centerOffset offset:CGPoint,atIndex index:Int) {
        let view = self.getLoadingView()
        self.showView(view: view, atIndex: index)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.centerXAnchor.constraint(equalTo: self.base.centerXAnchor, constant: offset.x).isActive = true
        view.centerYAnchor.constraint(equalTo: self.base.centerYAnchor, constant: offset.y).isActive = true
        view.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        view.heightAnchor.constraint(equalToConstant: view.frame.size.height).isActive = true
    }
    
    private func getLoadingView() -> UIView {
        let bgView = UIView()
        bgView.frame = CGRectMake(0, 0, 60, 50)
        
        let activity = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        activity.center = CGPointMake(30, 10)
        bgView.addSubview(activity)
        activity.startAnimating()
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = UIColor.black
        label.text = "加载中..."
        label.sizeToFit()
        label.center = CGPointMake(30, 40);
        bgView.addSubview(label)
        
        return bgView
    }
}


extension GNUtils where Base: UIView {
    func showNoDataView() {
        self.showNoDataView(centerOffset: CGPointZero, atIndex: -1)
    }
    func showNoDataView(atIndex index:Int) {
        self.showNoDataView(centerOffset: CGPointZero, atIndex:index)
    }
    
    func showNoDataView(centerOffset offset:CGPoint) {
        self.showNoDataView(centerOffset: offset, atIndex: -1)
    }
    
    func showNoDataView(centerOffset offset:CGPoint,atIndex index:Int) {
        let view = self.getNoDataView()
        self.showView(view: view, atIndex: index)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.centerXAnchor.constraint(equalTo: self.base.centerXAnchor, constant: offset.x).isActive = true
        view.centerYAnchor.constraint(equalTo: self.base.centerYAnchor, constant: offset.y).isActive = true
        view.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        view.heightAnchor.constraint(equalToConstant: view.frame.size.height).isActive = true
    }
    
    private func getNoDataView() -> UIView {
        let imgV = UIImageView()
        imgV.image = UIImage(named: "GNNotice.bundle/noData")
        imgV.frame = CGRectMake(0, 0, 155, 163);
        return imgV
    }
}




extension GNUtils where Base: UIView {
    func showNoNetView(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
        self.showNoNetView(target, action: action, for: controlEvents, centerOffset: CGPointZero, atIndex: -1)
    }
    func showNoNetView(_ target: Any?, action: Selector, for controlEvents: UIControl.Event,atIndex index:Int) {
        self.showNoNetView(target, action: action, for: controlEvents, centerOffset: CGPointZero, atIndex: index)
    }
    
    func showNoNetView(_ target: Any?, action: Selector, for controlEvents: UIControl.Event,centerOffset offset:CGPoint) {
        self.showNoNetView(target, action: action, for: controlEvents, centerOffset: offset, atIndex: -1)
    }
    
    func showNoNetView(_ target: Any?, action: Selector, for controlEvents: UIControl.Event,centerOffset offset:CGPoint,atIndex index:Int) {
        let view = self.getNoNetView(target, action: action, for: controlEvents)
        self.showView(view: view, atIndex: index)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.centerXAnchor.constraint(equalTo: self.base.centerXAnchor, constant: offset.x).isActive = true
        view.centerYAnchor.constraint(equalTo: self.base.centerYAnchor, constant: offset.y).isActive = true
        view.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        view.heightAnchor.constraint(equalToConstant: view.frame.size.height).isActive = true
    }
    
    private func getNoNetView(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) -> UIView {
        let imageHeight = 75.0;
        let labelHeight = 20.0;
        let buttonHieght = 40.0;
        let imageViewLabelMargin = 20.0;
        let labelButtonMargin = 20.0;
        
        
        let bgView = UIView()
        bgView.frame = CGRectMake(0, 0, 200, imageHeight + labelHeight + buttonHieght + imageViewLabelMargin + labelButtonMargin);
        
        
        let imgV = UIImageView()
        imgV.frame = CGRectMake(0, 0, 100, imageHeight)
        imgV.image = UIImage(named: "GNNotice.bundle/noData")
        imgV.contentMode = .scaleAspectFit
        imgV.center = CGPointMake(bgView.frame.size.width * 0.5, imgV.center.y)
        imgV.image = UIImage(named: "GNNotice.bundle/noNet")
        bgView.addSubview(imgV)
        
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = UIColor.lightGray
        label.text = "似乎已断开与互联网的连接"
        label.frame = CGRectMake(0, CGRectGetMaxY(imgV.frame) + imageViewLabelMargin, bgView.frame.size.width, labelHeight)
        label.center = CGPointMake(bgView.frame.size.width * 0.5, label.center.y);
        bgView.addSubview(label)
        
        
        let btn = UIButton()
        btn.frame = CGRectMake(0, CGRectGetMaxY(label.frame) + labelButtonMargin, 120, buttonHieght);
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        btn.setTitle("重试", for: .normal)
        btn.setTitle("重试", for: .highlighted)
        btn.titleLabel?.textAlignment = .center
        btn.layer.cornerRadius = 5
        btn.layer.masksToBounds = true
        btn.addTarget(target, action:action, for:controlEvents)
        btn.center = CGPointMake(bgView.frame.size.width * 0.5, btn.center.y)
        btn.backgroundColor = .black
        bgView.addSubview(btn)
        return bgView

    }
}
