//
//  ReactiveCellTableViewCell.swift
//  Reactive Swift
//
//  Created by YUSUF KESKİN on 4.07.2023.
//

import UIKit

class ReactiveCell: UITableViewCell {

    @IBOutlet weak var cellTextLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var tickView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

}
