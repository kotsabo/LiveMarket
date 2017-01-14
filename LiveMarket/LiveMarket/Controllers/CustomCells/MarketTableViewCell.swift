//
//  MarketTableViewCell.swift
//  LiveMarket
//
//  Created by Ilias Kotsampougioukoglou on 1/14/17.
//  Copyright © 2017 Mine. All rights reserved.
//

import UIKit

class MarketTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var sellButton: DarkButton!
    @IBOutlet weak var buyButton: DarkButton!
    @IBOutlet weak var sellLabel: UILabel!
    @IBOutlet weak var spreadLabel: UILabel!
    @IBOutlet weak var sellValueLabel: UILabel!
    @IBOutlet weak var buyValueLabel: UILabel!
    @IBOutlet weak var buyLabel: UILabel!
    @IBOutlet weak var sellHighlightLineView: UIView!
    @IBOutlet weak var sellHighlightValueLabel: UILabel!
    @IBOutlet weak var buyHighlightLineView: UIView!
    @IBOutlet weak var buyHighlightValueLabel: UILabel!
    @IBOutlet weak var sellFractionalPipLabel: UILabel!
    @IBOutlet weak var buyFractionalPipLabel: UILabel!
    
    //MARK: - Cell Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.customizeCell()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    //MARK: - Customize Cell
    
    private func customizeCell() {
        
        self.contentView.backgroundColor = Colors.DarkGray
        self.infoView.backgroundColor = Colors.DarkGray
        self.nameLabel.backgroundColor = Colors.MediumGray
    }

}
