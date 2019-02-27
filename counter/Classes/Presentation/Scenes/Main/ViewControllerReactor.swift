//
//  ViewControllerReactor.swift
//  counter
//
//  Created by Pich on 2/27/19.
//  Copyright © 2019 pich. All rights reserved.
//

import ReactorKit
import RxSwift

class ViewControllerReactor: Reactor {
    enum Action {
        case addBtnClicked
        case minusBtnClicked
    }
    enum Mutation {
        case add
        case minus
    }
    struct State {
        var counter: Int
    }
    var initialState: ViewControllerReactor.State
    init() {
        initialState = State(counter: 0)
    }
    
    func mutate(action: ViewControllerReactor.Action) -> Observable<ViewControllerReactor.Mutation> {
        switch action {
        case .addBtnClicked:
            return Observable.just(Mutation.add)
        case .minusBtnClicked:
            return Observable.just(Mutation.minus)
        }
    }
    func reduce(state: ViewControllerReactor.State, mutation: ViewControllerReactor.Mutation) -> ViewControllerReactor.State {
        var newState = state
        
        switch mutation {
        case .add:
            newState.counter += 1
            return newState
        case .minus:
            newState.counter -= 1
            return newState
        }
    }
}
