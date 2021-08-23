//
//  PrefectureDataSource.swift
//  Kadai11-MVVM
//
//  Created by 今村京平 on 2021/08/23.
//

import Foundation
import RxSwift
import RxCocoa

final class PrefectureDataSource:NSObject, UITableViewDataSource, RxTableViewDataSourceType {

    typealias Element = [PrefectureItems]

    var prefectureItems: [PrefectureItems] = []

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prefectureItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: PrefectureTableViewCell.identifier,
            for: indexPath
        ) as! PrefectureTableViewCell
        let prefecture = prefectureItems[indexPath.row].title
        cell.configure(prefecture: prefecture)
        return cell
    }

    // MARK: - RxTableViewDataSourceType
    func tableView(_ tableView: UITableView, observedEvent: Event<[PrefectureItems]>) {
        Binder(self) { dataSource, element in
            dataSource.prefectureItems = element
            tableView.reloadData()
        }
        .on(observedEvent)
    }
}
