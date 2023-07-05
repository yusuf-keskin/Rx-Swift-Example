//
//  ViewController.swift
//  Reactive Swift
//
//  Created by YUSUF KESKİN on 3.07.2023.
//

import UIKit
import RxSwift
import RxCocoa

class MainVC: UIViewController {
    
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel : ViewModel?
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindTableViewData()
        bindSearchBar()
        
    }
    
    func bindTableViewData() {
        let techApi = TechStoreApiManager()
        let foodApi = FoodStoreApiManager()
        viewModel = ViewModel(techApi: techApi, foodApi: foodApi)
        
        viewModel?.combinedPublisher.bind(
            to: tableView
                .rx
                .items(
                    cellIdentifier: "ReactiveCell",
                    cellType: ReactiveCell.self)) { row, model, cell in
                        cell.cellTextLabel.text = model.name
                        cell.priceLabel.text = "\(model.price)"
                    }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(ApiDataModel.self).bind { model in
            print(model.price)
        }.disposed(by: disposeBag)
        
        viewModel?.combinedPublisher
            .map { $0.first?.name }
            .bind(to:self.totalPriceLabel.rx.text)
            .disposed(by:self.disposeBag)
    }
    
    func bindSearchBar(){
        searchBar.rx.text
            .debounce(.seconds(1), scheduler: MainScheduler.instance)
        .map{"My offer: \($0 ?? "")" }
            .bind { text in
            self.totalPriceLabel.text = text
        }.disposed(by: disposeBag)
    }
}

