//
//  TVPopularViewController.swift
//  Demo
//
//  Created by melisa öztürk on 20.11.2020.
//

import UIKit

class TVPopularViewController: UIViewController {

    let viewModel = TVPopularViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.getTVTPopularData(completion: { response in
            //TODO: show data - updateUI
        }, completionHandler: { error in
//            TODO: Show error
        })
    }

}
