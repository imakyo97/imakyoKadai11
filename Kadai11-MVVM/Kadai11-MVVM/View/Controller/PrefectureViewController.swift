//
//  PrefectureViewController.swift
//  Kadai11-MVVM
//
//  Created by 今村京平 on 2021/08/23.
//

import UIKit
import RxSwift
import RxCocoa

protocol PrefectureViewControllerDelegate: AnyObject {
    func presentPrefecture(prefecture: String)
}

class PrefectureViewController: UIViewController, UITableViewDelegate {

    @IBOutlet private weak var cancelButton: UIBarButtonItem!
    @IBOutlet private weak var prefectureTableView: UITableView!

    weak var delegate: PrefectureViewControllerDelegate?

    private let viewModel: PrefectureViewModelType = PrefectureViewModel()
    private let disposeBag = DisposeBag()
    private let dataSource = PrefectureDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
        setupTableView()
    }

    private func setupBinding() {
        cancelButton.rx.tap
            .bind(onNext: { [weak self] in
                self?.viewModel.inputs.didTapCancelButton()
            })
            .disposed(by: disposeBag)

        viewModel.outputs.event
            .drive(onNext: { [weak self] event in
                switch event {
                case .dismiss:
                    self?.dismiss(animated: true, completion: nil)
                case .prsentPrefecture(let prefecture):
                    self?.delegate?.presentPrefecture(prefecture: prefecture)
                }
            })
            .disposed(by: disposeBag)

        viewModel.outputs.items
            .bind(to: prefectureTableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }

    private func setupTableView() {
        prefectureTableView.register(
            PrefectureTableViewCell.nib,
            forCellReuseIdentifier: PrefectureTableViewCell.identifier
        )
        prefectureTableView.rx.setDelegate(self).disposed(by: disposeBag)
    }

    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.inputs.didSelectRow(index: indexPath.row)
    }
}

// MARK: - instantiate()
extension PrefectureViewController {
    static func instantiate() -> PrefectureViewController {
        UIStoryboard.init(name: "Prefecture", bundle: nil)
            .instantiateInitialViewController()
            as! PrefectureViewController
    }
}
