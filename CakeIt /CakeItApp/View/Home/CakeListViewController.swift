//
//  CakeListViewController.swift
//  CakeItApp
//
//  Created by David McCallum on 20/01/2021.
//

import UIKit

class CakeListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var apiManager: APICakeProtocol = CakeServices()
    var viewModel: CakeListViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CakeListViewModel(apiManager: apiManager)
//        updateCache()
        prepareTableView()
        setUpUI()
        fetchCake()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // updating URLCache default cache size for image caching or else can use NSCache/Local store/3rd part like SDWebimage
    private func updateCache() {
        let memoryCapacity = 500 * 1024 * 1024
        let discCapacity   = 500 * 1024 * 1024
        _ = URLCache.init(memoryCapacity: memoryCapacity, diskCapacity: discCapacity, diskPath: "myDiscPath")
    }
    
    private func setUpUI() {
        title = viewModel.fetchNavigationTitle() ?? ""
    }
    
    private func prepareTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.startAnimating()
        tableView.backgroundView = activityIndicator
    }
    
    private func fetchCake() {
        viewModel.fetchCakes { [weak self] isSuccess in
            DispatchQueue.main.async {
                self?.tableView.backgroundView = nil
                self?.tableView.setNoContentText(to:"")
                isSuccess ? self?.tableView.reloadData() : self?.showErrorMessage()
            }
        }
    }
    
    private func showErrorMessage() {
        tableView.setNoContentText(to: NSLocalizedString("NoCakeListErrorMessage", comment: ""))
    }
}

extension CakeListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cake = viewModel.fetchSelectedCake(selectedIndex:indexPath.row)  {
            AppRouter.pushToCakeDetailScreen(navigationConroller: self.navigationController ?? UINavigationController(), selectedCake: cake)
        }
    }
}

extension CakeListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell = UITableViewCell()
        cell = loadMyCakeTableViewCell(indexPath: indexPath)
        return cell
    }
    
    // MARK: - Load Custom Cells
    func loadMyCakeTableViewCell(indexPath: IndexPath) -> CakeListTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CakeListTableViewCell", for:indexPath) as! CakeListTableViewCell
        cell.selectionStyle = .none
        cell.bottomSeparator.isHidden = (indexPath.row == (viewModel.numberOfRows() - 1))
        let selectedCake = viewModel.fetchSelectedCake(selectedIndex: indexPath.row)
        cell.prepareCell(viewModel: CakeListTableViewCellVM(apiManager: apiManager, cake: selectedCake))
        return cell
    }
}
