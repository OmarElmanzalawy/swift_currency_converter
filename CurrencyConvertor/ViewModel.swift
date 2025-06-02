//
//  ViewModel.swift
//  CurrencyConvertor
//
//  Created by MAC on 29/04/2025.
//

import Foundation

class ViewModel: ObservableObject{
    
    @Published var convertedAmount = "1.0"
    @Published var baseAmount = "1.0"
    @Published var baseCuurency: CurrencyChoice = .Egyptian
    @Published var convertedCurrency: CurrencyChoice = .Usa
    
    var numberFormatter: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = ""
        return formatter
    }
    
}
