//
//  PrefectureTableViewCell.swift
//  Kadai11-MVVM
//
//  Created by 今村京平 on 2021/08/23.
//

import UIKit

class PrefectureTableViewCell: UITableViewCell {

    static var identifier: String { String(describing: self) }
    static var nib: UINib { UINib(nibName: PrefectureTableViewCell.identifier, bundle: nil) }

    @IBOutlet private weak var prefectureLabel: UILabel!

    func configure(prefecture: String) {
        prefectureLabel.text = prefecture
    }
}
