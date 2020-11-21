//
//  Loading.swift
//  Demo
//
//  Created by melisa öztürk on 21.11.2020.
//

import Foundation
import UIKit

class Loading: UIView {
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    var view: UIView!
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           xibSetup()
       }
       
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           xibSetup()
       }
       
       func xibSetup(){
           view = loadViewFromNib()
           view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
           addSubview(view)
        setup()
       }
       
       func loadViewFromNib() -> UIView {
           let bundle = Bundle(for: type(of: self))
           var identifier = ""
           identifier =  NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
           let nib = UINib(nibName: identifier, bundle: bundle)
           let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
           return view
       }

    private func setup() {
        self.view.backgroundColor = .black
        self.view.alpha = 0.8
        self.activity.startAnimating()
    }
}
