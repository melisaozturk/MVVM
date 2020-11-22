//
//  SplashViewController.swift
//  Demo
//
//  Created by melisa öztürk on 21.11.2020.
//

import UIKit

class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        perform(#selector(showView), with: nil, afterDelay: 2)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @objc private func showView(){
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabbarController") as? TabbarController {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
