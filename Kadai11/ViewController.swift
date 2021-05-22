//
//  ViewController.swift
//  Kadai11
//
//  Created by 今村京平 on 2021/05/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var prefecturesLabel: UILabel!

    @IBAction func cancelExit(segue: UIStoryboardSegue) {
    }
    @IBAction func selectPrefecture (segue: UIStoryboardSegue) {
        guard let selectVC = segue.source as? SelectViewController else { return }
        prefecturesLabel.text = selectVC.prefectureText
    }
}
