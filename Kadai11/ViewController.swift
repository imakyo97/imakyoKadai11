//
//  ViewController.swift
//  Kadai11
//
//  Created by 今村京平 on 2021/05/20.
//

import UIKit

class ViewController: UIViewController {
    private var label2: UILabel!
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // label1を作成
        let label1  = UILabel()
        label1.frame = CGRect(x: 0, y: 0, width: 90, height: 30)
        label1.text = "都道府県"
        label1.textColor = .black
        label1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label1)
        label1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        label1.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        // label2を作成
        label2 = UILabel()
        label2.frame = CGRect(x: 0, y: 0, width: 90, height: 30)
        label2.text = "未選択"
        label2.textColor = .black
        label2.textAlignment = .center
        label2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label2)
        label2.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        label2.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        // buttonを作成
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        button.setTitle("選択", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(self.segue(_:)), for: UIControl.Event.touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        view.rightAnchor.constraint(equalTo: button.rightAnchor, constant: 50).isActive = true
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: 85).isActive = true
    }
    // MARK: - viewWillApper
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let prefecture = SelectViewController.prefecture {
            label2.text = prefecture
        }
    }
    @objc func segue(_ sender: UIButton) {
        guard let selectViewController = SelectViewController.instantiate() else { return }
        let navigationController = UINavigationController(rootViewController: selectViewController)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
}
