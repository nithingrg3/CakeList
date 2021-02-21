//
//  CakeDetailViewController.swift
//  CakeItApp
//
//  Created by David McCallum on 21/01/2021.
//

import UIKit

class CakeDetailViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var apiManager: APICakeProtocol = CakeServices()
    private var viewModel: CakeDetailViewModelProtocol!
    var cake:Cake?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CakeDetailViewModel(apiManager: apiManager, cake: cake)
        prepareTableView()
        setUpUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    private func setUpUI() {
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        title = viewModel.fetchNavigationTitle() ?? ""
    }

    private func prepareTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension CakeDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //row selection 
    }
}

extension CakeDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: viewModel.headerViewHeight()))
        let cakeImage = UIImageView(frame: headerView.frame)
        viewModel.fetchCakeImage() { isSuccess, image in
            DispatchQueue.main.async {
                if let downloadedImage = image {
                    cakeImage.image = downloadedImage
                }
                else {
                    cakeImage.image = UIImage(named: "CakePlaceholder")
                }
            }
        }
        headerView.addSubview(cakeImage)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return viewModel.headerViewHeight()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell = UITableViewCell()
        switch indexPath.row {
        case 0:
            cell = loaCakeTitleTableViewCell(indexPath: indexPath)
        case 1:
            cell = loaCakeDescriptionTableViewCell(indexPath: indexPath)
        default:
            return cell
        }
        cell.selectionStyle = .none
        return cell
    }
    
    // MARK: - Load Custom Cells
    func loaCakeTitleTableViewCell(indexPath: IndexPath) -> CakeTitleTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CakeTitleTableViewCell", for:indexPath) as! CakeTitleTableViewCell
        cell.titleLabel.text = viewModel.fetchCakeName() ?? ""
        return cell
    }
    
    func loaCakeDescriptionTableViewCell(indexPath: IndexPath) -> CakeDescriptionTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CakeDescriptionTableViewCell", for:indexPath) as! CakeDescriptionTableViewCell
        cell.descLabel.text = viewModel.fetchCakeDescription() ?? ""
        return cell
    }
}
