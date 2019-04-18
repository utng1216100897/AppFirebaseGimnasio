//
//  ViewControllerTableViewCell.swift
//  GimnasioPollo
//
//  Created by Mike on 4/15/19.
//  Copyright © 2019 UTNG. All rights reserved.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEge: UILabel!
    @IBOutlet weak var lblPeso: UILabel!
    @IBOutlet weak var lblAlt: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
