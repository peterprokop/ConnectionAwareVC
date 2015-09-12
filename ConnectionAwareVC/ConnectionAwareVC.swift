//
//  ConnectionAwareVC.swift
//  Crowdshipping
//
//  Created by Peter Prokop on 30/03/15.
//  Copyright (c) 2015 Whitescape. All rights reserved.
//

import UIKit
import ReachabilitySwift

class ConnectionAwareVC: UIViewController {
    
    // Customizable
    var animationDuration = NSTimeInterval(0.5)
    var popupText = "No active internet connection"
    var popupBackgroundColor = UIColor.redColor()
    var popupTextColor = UIColor.whiteColor()
    
    let reachability = Reachability.reachabilityForInternetConnection()
    var label : UILabel?
    
    deinit {
        reachability.stopNotifier()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        weak var wSelf = self
        
        reachability.whenReachable = { reachability in
            if let sSelf = wSelf {
                dispatch_async(dispatch_get_main_queue()) {
                    if sSelf.label != nil {
                        UIView.animateWithDuration(self.animationDuration,
                            animations: { () -> Void in
                                sSelf.label!.alpha = 0
                                sSelf.label = nil
                        })
                    }
                }
            }
        }
        
        reachability.whenUnreachable = { reachability in
            if let sSelf = wSelf {
                dispatch_async(dispatch_get_main_queue()) {
                    sSelf.showNoConnectionMessage()
                }
            }
        }
        
        reachability.startNotifier()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if !reachability.isReachable() {
            showNoConnectionMessage()
        }
    }
    
    func showNoConnectionMessage() {
        if label != nil {
            return
        }
        
        let bounds = view.bounds
        label = UILabel(frame: CGRectMake(bounds.origin.x, bounds.origin.y, bounds.size.width, 66))
        label!.text = popupText
        label!.backgroundColor = popupBackgroundColor
        label!.textColor = popupTextColor
        
        label!.alpha = 0
        label!.textAlignment = .Center
        
        view.addSubview(label!)

        label!.setTranslatesAutoresizingMaskIntoConstraints(false)
        var topGuide = self.topLayoutGuide
        let viewsDictionary = ["label": label!, "topGuide": topGuide] as [NSObject: AnyObject]

        let constraintsV = NSLayoutConstraint.constraintsWithVisualFormat("V:[topGuide]-0-[label(10@20)]",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: viewsDictionary)
        
        let constraintsH = NSLayoutConstraint.constraintsWithVisualFormat("|-0-[label]-0-|",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: viewsDictionary)
        
        self.view.addConstraints(constraintsV + constraintsH)
        
        UIView.animateWithDuration(animationDuration,
            animations: { () -> Void in
                self.label!.alpha = 0.5
        })
    }
}
