//
//  MovieTopRatedViewController.swift
//  Demo
//
//  Created by melisa öztürk on 20.11.2020.
//

import UIKit

class MovieTopRatedViewController: UIViewController {

    let viewModel = MovieTopRatedViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.getTopRatedData(completion: { response in
            //TODO: show data - updateUI
        }, completionHandler: { error in
//            TODO: Show error
        })
    }
}
