//
//  MoviePopularViewController.swift
//  Demo
//
//  Created by melisa öztürk on 20.11.2020.
//

import UIKit

class MoviePopularViewController: UIViewController {

    let viewModel = MoviePopularViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.viewModel.getPopularData(completion: { response in
            //TODO: show data - updateUI
        }, completionHandler: { error in
//            TODO: Show error
        })
    }

}
