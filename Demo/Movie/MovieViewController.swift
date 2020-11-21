//
//  MovieTopRatedViewController.swift
//  Demo
//
//  Created by melisa öztürk on 20.11.2020.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let viewModel = MovieViewModel()
    var topRatedModel: MovieTopRatedModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableRegister()
        
        self.viewModel.getTopRatedData(completion: { [weak self] response in
            if let _ = self {
                self!.topRatedModel = response
            }
        }, completionHandler: { [weak self] error in
            if let _ = self {
                //            TODO: Show error
            }
        })
        
        self.viewModel.getNowPlayingData(completion: { [weak self] response in
            if let _ = self {
            }
        }, completionHandler: { [weak self] error in
            if let _ = self {
                //            TODO: Show error
            }
        })

        self.viewModel.getPopularData(completion: { [weak self] response in
            if let _ = self {
            }
        }, completionHandler: { [weak self] error in
            if let _ = self {
                //            TODO: Show error
            }
        })
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
       
    }
    
    private func tableRegister() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.tableFooterView = UIView()
        self.tableView.separatorStyle = .none
        
        self.tableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
    }
}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.selectionStyle = .none
        
        switch indexPath.section {
        case 0:
            cell.pageSource = .topRated
            cell.lblTitle.text = "Top Rated"
            cell.topRatedModel = self.viewModel.topRatedModel
            cell.collectionView.reloadData()
        case 1:
            cell.pageSource = .nowPlaying
            cell.lblTitle.text = "Now Playing"
            cell.nowPlayingModel = self.viewModel.nowPlayingModel
            cell.collectionView.reloadData()
        case 2:
            cell.pageSource = .popular
            cell.lblTitle.text = "Popular"
            cell.popularModel = self.viewModel.popularModel
            cell.collectionView.reloadData()
        default:
            return UITableViewCell()
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
