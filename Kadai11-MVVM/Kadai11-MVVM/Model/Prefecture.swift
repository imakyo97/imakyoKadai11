//
//  Prefecture.swift
//  Kadai11-MVVM
//
//  Created by 今村京平 on 2021/08/23.
//

import RxSwift
import RxRelay

protocol PrefectureModel {
    var prefecture: Observable<String> { get }
    var prefectureItems: [PrefectureItems] { get }
    func didSelectedPrefecture(index: Int)
}

final class Prefecture: PrefectureModel {

    private let prefectureRelay = PublishRelay<String>()
    var prefectureItems: [PrefectureItems] = PrefectureItems.allCases

    var prefecture: Observable<String> {
        return prefectureRelay.asObservable()
    }

    func didSelectedPrefecture(index: Int) {
        let prefecture = prefectureItems[index].title
        prefectureRelay.accept(prefecture)
    }
}
