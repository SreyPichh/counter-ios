//
//  ViewController.swift
//  counter
//
//  Created by Pich on 2/27/19.
//  Copyright © 2019 pich. All rights reserved.
//

import UIKit
import ReactorKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    var subview: ViewControllerSubview = ViewControllerSubview()
    var disposeBag: DisposeBag = DisposeBag()

}
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.subview.header)
        self.view.addSubview(self.subview.addBtn)
        self.view.addSubview(self.subview.counterLabel)
        self.view.addSubview(self.subview.minusBtn)
        
        self.reactor = ViewControllerReactor()
    }
    
    override func viewDidLayoutSubviews() {
        self.subview.updatedConstraints()
    }
}
extension ViewController: StoryboardView {
    func bind(reactor: ViewControllerReactor) {
        self.subview.addBtn.rx.tap
            .map{Reactor.Action.addBtnClicked}
        .bind(to: reactor.action)
        .disposed(by: disposeBag)
        
        self.subview.minusBtn.rx.tap
            .map{Reactor.Action.minusBtnClicked}
        .bind(to: reactor.action)
        .disposed(by: disposeBag)
        
        self.reactor?.state
            .map{String($0.counter)}
        .bind(to: self.subview.counterLabel.rx.text)
        .disposed(by: disposeBag)
    }
}

