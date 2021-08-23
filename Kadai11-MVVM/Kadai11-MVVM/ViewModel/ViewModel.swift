//
//  ViewModel.swift
//  Kadai11-MVVM
//
//  Created by 今村京平 on 2021/08/23.
//

import RxSwift
import RxCocoa

protocol ViewModelInput {
    func didTapChangeButton()
}

protocol ViewModelOutput {
    var event: Driver<ViewModel.Event> { get }
}

protocol ViewModelType {
    var inputs: ViewModelInput { get }
    var outputs: ViewModelOutput { get }
}

final class ViewModel: ViewModelInput, ViewModelOutput {

    private let eventRelay = PublishRelay<Event>()

    var event: Driver<Event> {
        eventRelay.asDriver(onErrorDriveWith: .empty())
    }

    enum Event {
        case presentPrefectureVC
    }

    func didTapChangeButton() {
        eventRelay.accept(.presentPrefectureVC)
    }
}

extension ViewModel: ViewModelType {
    var inputs: ViewModelInput {
        return self
    }

    var outputs: ViewModelOutput {
        return self
    }
}
