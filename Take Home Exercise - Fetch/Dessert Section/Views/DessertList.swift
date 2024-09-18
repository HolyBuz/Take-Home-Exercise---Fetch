//
//  DessertList.swift
//  Take Home Exercise - Fetch
//
//  Created by Alessandro Loi on 9/17/24.
//

import SwiftUI

struct DessertList: View {
    
    @StateObject private var viewModel: DessertListViewModel
    private let viewModelFactory: DessertViewModelFactory
    
    init(factory: DessertViewModelFactory) {
        viewModelFactory = factory
        _viewModel = StateObject(wrappedValue: factory.makeDessertListViewModel())
    }
    
    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ProgressView("Loading Desserts")
            } else {
                List(viewModel.desserts) { desert in
                    NavigationLink(destination: DessertDetailView(viewModel: viewModelFactory.makeDessertDetailViewModel(for: desert))) {
                        DessertRow(desert: desert)
                    }
                }
            }
        }
        .alert(isPresented: .constant(viewModel.errorMessage != nil)) {
            Alert(title: Text("Error"),
                  message: Text(viewModel.errorMessage ?? ""),
                  dismissButton: .default(Text("Retry")) {
                Task {
                    await viewModel.getDesserts()
                }
            })
        }
        .task {
            await viewModel.getDesserts()
        }
        .navigationTitle("Desserts")
    }
}

