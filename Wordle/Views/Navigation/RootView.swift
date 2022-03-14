//
//  RootView.swift
//  Wordle
//
//  Created by Josh Aidelman on 2022-03-08.
//

import SwiftUI

struct RootView: View {
    @StateObject var viewModel: RootViewModel
    
    init() {
        let vm = RootViewModel()
        _viewModel = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        switch(viewModel.currentView) {
        case .home:
            HomeView().environmentObject(viewModel)
        case .game:
            GameView(viewModel: viewModel.gameViewModel).environmentObject(viewModel)
        case .stats:
            StatsView().environmentObject(viewModel)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
.previewInterfaceOrientation(.landscapeLeft)
    }
}

