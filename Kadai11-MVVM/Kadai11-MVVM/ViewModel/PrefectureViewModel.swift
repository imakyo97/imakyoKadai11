//
//  PrefectureViewModel.swift
//  Kadai11-MVVM
//
//  Created by 今村京平 on 2021/08/23.
//

import RxSwift
import RxCocoa

protocol PrefectureViewModelInput {
    func didTapCancelButton()
    func didSelectRow(index: Int)
}

protocol PrefectureViewModelOutput {
    var event: Driver<PrefectureViewModel.Event> { get }
    var items: Observable<[PrefectureItems]> { get }
}

protocol PrefectureViewModelType {
    var inputs: PrefectureViewModelInput { get }
    var outputs: PrefectureViewModelOutput { get }
}

final class PrefectureViewModel: PrefectureViewModelInput, PrefectureViewModelOutput {

    private let model: PrefectureModel = Prefecture()
    private let eventRelay = PublishRelay<Event>()
    private let disposeBag = DisposeBag()

    init() {
        setupBinding()
    }

    var event: Driver<Event> {
        return eventRelay.asDriver(onErrorDriveWith: .empty())
    }

    lazy var items: Observable<[PrefectureItems]> = Observable.just(model.prefectureItems)

    enum Event {
        case dismiss
        case prsentPrefecture(String)
    }

    private func setupBinding() {
        model.prefecture
            .map(Event.prsentPrefecture)
            .bind(to: eventRelay)
            .disposed(by: disposeBag)
    }

    func didTapCancelButton() {
        eventRelay.accept(.dismiss)
    }

    func didSelectRow(index: Int) {
        model.didSelectedPrefecture(index: index)
        eventRelay.accept(.dismiss)
    }
}

extension PrefectureViewModel: PrefectureViewModelType {
    var inputs: PrefectureViewModelInput {
        return self
    }

    var outputs: PrefectureViewModelOutput {
        return self
    }
}
