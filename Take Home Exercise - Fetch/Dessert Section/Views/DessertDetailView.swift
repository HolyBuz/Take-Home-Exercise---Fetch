//
//  DessertDetailView.swift
//  Take Home Exercise - Fetch
//
//  Created by Alessandro Loi on 9/17/24.
//

import SwiftUI

struct DessertDetailView: View {

    @StateObject private var viewModel: DessertDetailViewModel
    
    init(viewModel: DessertDetailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading \(viewModel.name)")
            } else {
                detailContent
            }
        }
        .alert(isPresented: .constant(viewModel.errorMessage != nil)) {
            Alert(title: Text("Error"),
                  message: Text(viewModel.errorMessage ?? ""),
                  dismissButton: .default(Text("Retry")) {
                Task {
                    await viewModel.getDessertDetail()
                }
            })
        }
        .task {
            await viewModel.getDessertDetail()
        }
        .navigationTitle(viewModel.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    private var detailContent: some View {
        List {
            if let ingredients = viewModel.ingredients {
                Section(header: Text("Ingredients").bold()) {
                    Text(ingredients)
                }
            }
            if let instructions = viewModel.instructions {
                Section(header: Text("Instructions").bold()) {
                    Text(instructions)
                }
            }
        }
    }
}

