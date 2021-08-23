//
//  ViewController.swift
//  Kadai11-MVVM
//
//  Created by 今村京平 on 2021/08/23.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet private weak var prefectureLabel: UILabel!
    @IBOutlet private weak var changeButton: UIButton!

    private let viewModel: ViewModelType = ViewModel()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
    }

    private func setupBinding() {
        changeButton.rx.tap
            .bind(onNext: { [weak self] in
                self?.viewModel.inputs.didTapChangeButton()
            })
            .disposed(by: disposeBag)

        viewModel.outputs.event
            .drive(onNext: { [weak self] event in
                switch event {
                case .presentPrefectureVC:
                    let prefectureVC = PrefectureViewController.instantiate()
                    prefectureVC.delegate = self
                    let navigationController = UINavigationController(rootViewController: prefectureVC)
                    self?.present(navigationController, animated: true, completion: nil)
                }
            })
            .disposed(by: disposeBag)
    }
}

extension ViewController: PrefectureViewControllerDelegate {
    func presentPrefecture(prefecture: String) {
        prefectureLabel.text = prefecture
    }
}
