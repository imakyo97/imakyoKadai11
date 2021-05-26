//
//  ViewController.swift
//  Kadai11
//
//  Created by 今村京平 on 2021/05/20.
//

import UIKit

class ViewController: UIViewController {
    private var label1: UILabel!
    private var label2: UILabel!
    private var button: UIButton!
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        label1  = UILabel()
        label1.text = "都道府県"
        label1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label1)
     
        label2 = UILabel()
        label2.text = "未選択"
        label2.textAlignment = .center
        label2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label2)
        button = UIButton()
        button.setTitle("選択", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        NSLayoutConstraint.activate([
            label1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            label1.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            
            label2.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            label2.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 85)
        ])
    }
    
    @objc func didTapButton(_ sender: UIButton) {
        let selectViewController = SelectViewController.instantiate(
            didSelect:{ [weak self] in
                    self?.label2.text = $0
                })
        let navigationController = UINavigationController(rootViewController: selectViewController)
        present(navigationController, animated: true, completion: nil)
    }
}
