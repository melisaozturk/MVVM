//
//  TVViewController.swift
//  Demo
//
//  Created by melisa öztürk on 20.11.2020.
//

import UIKit

class TVViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = TVViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableRegister()
        
        self.viewModel.getTVTopRatedData(completion: { [weak self] response in
            if let _ = self {
                self!.tableView.reloadData()
            }
        }, completionHandler: { [weak self] error in
            if let _ = self {
                //            TODO: Show error
            }
        })
        
        self.viewModel.getTVTPopularData(completion: { [weak self] response in
            if let _ = self {
                self!.tableView.reloadData()
            }
        }, completionHandler: { [weak self] error in
            if let _ = self {
                //            TODO: Show error
            }
        })
    }
    
    private func tableRegister() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.separatorStyle = .none
        
        self.tableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
    }
    
    @IBAction func actionSegmentedControl(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            self.tableView.reloadData()
        case 1:
            self.tableView.reloadData()
        default: break
        }
    }
}


extension TVViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch self.segmentedControl.selectedSegmentIndex {
        case 0:
            if self.viewModel.tvTopRatedModel != nil {
                return self.viewModel.tvTopRatedModel.results.count
            }
        case 1:
            if self.viewModel.tvPopularModel != nil {
                return self.viewModel.tvPopularModel.results.count
            }
        default:
            return 0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.selectionStyle = .none
        
        switch self.segmentedControl.selectedSegmentIndex {
        case 0:
            cell.lblTitle.text = self.viewModel.tvTopRatedModel.results[indexPath.row].name
            break
        case 1:
            cell.lblTitle.text = self.viewModel.tvPopularModel.results[indexPath.row].name
        default:
            break
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
