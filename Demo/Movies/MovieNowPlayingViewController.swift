//
//  MovieNowPlayingViewController.swift
//  Demo
//
//  Created by melisa öztürk on 20.11.2020.
//

import UIKit

class MovieNowPlayingViewController: UIViewController {

    let viewModel = MovieNowPlayingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.viewModel.getNowPlayingData(completion: { response in
            //TODO: show data - updateUI
        }, completionHandler: { error in
//            TODO: Show error
        })
    }

}
