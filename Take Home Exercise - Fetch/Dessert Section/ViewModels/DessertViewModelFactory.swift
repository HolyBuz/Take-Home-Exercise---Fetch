//
//  DessertViewModelFactory.swift
//  Take Home Exercise - Fetch
//
//  Created by Alessandro Loi on 9/17/24.
//

protocol DessertViewModelFactory {
    func makeDessertListViewModel() -> DessertListViewModel
    func makeDessertDetailViewModel(for dessert: Meal) -> DessertDetailViewModel
}

class DefaultDessertViewModelFactory: DessertViewModelFactory {
    
    private let service: DessertListServiceable & DessertDetailServiceable
    
    init(service: DessertListServiceable & DessertDetailServiceable) {
        self.service = service
    }
    
    func makeDessertListViewModel() -> DessertListViewModel {
        DessertListViewModel(service: service)
    }
    
    func makeDessertDetailViewModel(for dessert: Meal) -> DessertDetailViewModel {
        DessertDetailViewModel(service: service, dessert: dessert)
    }
}

