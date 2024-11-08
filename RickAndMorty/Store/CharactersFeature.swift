//
//  CharactersFeature.swift
//  RickAndMorty
//
//  Created by bod on 11/8/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct CharactersFeature {
    
    private let service = NetworkService()
    
    //MARK: - State
    @ObservableState
    struct State {
        var viewState: MainViewState = .emptyList
        var characters: [Character] = []
        var isLoading = false
        var currentPage = 1
        var totalPageCount = 0
    }
    
    //MARK: - Action
    enum Action {
        case start
        case didScrollToBottom
        case response(PageDataModel)
        case error(Error)
    }
    
    //MARK: - Reducer
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            case .start, .didScrollToBottom:
                state.isLoading = true
                return .run { [page = state.currentPage] send in
                    do {
                        let result = try await service.fetchManufacturers(page: page)
                        await send(.response(result))
                    } catch {
                        await send(.error(error))
                    }
                }
                
            case .response(let pageModel):
                state.isLoading = false
                state.characters.append(contentsOf: pageModel.results)
                state.currentPage += 1
                state.totalPageCount = pageModel.info.pages
                state.viewState = .content(state.characters)
                return .none
                
            case .error(let error):
                state.isLoading = false
                state.viewState = .error(error.localizedDescription)
                return .none
            }
        }
    }
}

// MARK: - View State

enum MainViewState: Equatable {
    case emptyList
    case content([Character])
    case error(String)
    
    static func == (lhs: MainViewState, rhs: MainViewState) -> Bool {
        switch (lhs, rhs) {
        case (.emptyList, .emptyList):
            return true
        case (.content(_), .content(_)):
            return true
        case (.error(_), .error(_)):
            return true
        default:
            return false
        }
    }
}

