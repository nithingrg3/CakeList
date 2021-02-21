//
//  CakeListTableViewCell.swift
//  CakeItApp
//
//  Created by Nitin George on 20/02/2021.
//

import UIKit

class CakeListTableViewCell: UITableViewCell {

    @IBOutlet weak var cakeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var bottomSeparator: UIView!
    
    private var viewModel: CakeListTableViewCellVMProtocol!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func prepareCell(viewModel: CakeListTableViewCellVM) {
        self.viewModel = viewModel
        setUpUI()
    }

    private func setUpUI() {
        titleLabel.text = viewModel.fetchCakeName() ?? ""
        descLabel.text = viewModel.fetchCakeDescription() ?? ""
        viewModel.fetchImage() { [weak self]isSuccess, image in
            DispatchQueue.main.async {
                guard let downloadedImage = image else {
                    self?.cakeImageView.image = UIImage(named: "CakePlaceholder")
                    return
                }
                self?.cakeImageView.image = downloadedImage
            }
        }
    }
}
