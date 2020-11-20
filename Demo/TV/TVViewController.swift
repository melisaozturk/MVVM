//
//  TVViewController.swift
//  Demo
//
//  Created by melisa öztürk on 20.11.2020.
//

import UIKit

class TVViewController: UIViewController {

    let viewModel = TVViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.getTVTopRatedData(completion: { response in
            //TODO: show data - updateUI
        }, completionHandler: { error in
//            TODO: Show error
        })
        
        self.viewModel.getTVTPopularData(completion: { response in
            //TODO: show data - updateUI
        }, completionHandler: { error in
//            TODO: Show error
        })
    }

}
