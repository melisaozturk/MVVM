//
//  MovieTopRatedViewController.swift
//  Demo
//
//  Created by melisa öztürk on 20.11.2020.
//

import UIKit

class MovieViewController: UIViewController {

    let viewModel = MovieViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.getTopRatedData(completion: { response in
            //TODO: show data - updateUI
        }, completionHandler: { error in
//            TODO: Show error
        })
        
        
        self.viewModel.getNowPlayingData(completion: { response in
            //TODO: show data - updateUI
        }, completionHandler: { error in
//            TODO: Show error
        })
        
        
        self.viewModel.getPopularData(completion: { response in
            //TODO: show data - updateUI
        }, completionHandler: { error in
//            TODO: Show error
        })

        
    }
}
