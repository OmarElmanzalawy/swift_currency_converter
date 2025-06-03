//
//  ViewModel.swift
//  CurrencyConvertor
//
//  Created by MAC on 29/04/2025.
//

import Foundation

class ViewModel: ObservableObject{
    
    static let shared = ViewModel()
    
    @Published var convertedAmount: Double = 1.0
    @Published var baseAmount: Double = 1.0
    @Published var baseCuurency: CurrencyChoice = .Egyptian
    @Published var convertedCurrency: CurrencyChoice = .Usa
    @Published var rates: Rates?
    @Published var isLoading: Bool = true
    @Published var erroMessage: String = ""
    
    var numberFormatter: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = ""
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 6 
        return formatter
    }
    
    func fetchRates()async{
        rates = await ApiService.fetchExchangeRate()
    }
    
    func reverseConversion(){
        let temp = self.baseAmount
        let temp2 = self.baseCuurency
        self.baseAmount = self.convertedAmount
        self.baseCuurency = self.convertedCurrency
        self.convertedCurrency = temp2
        self.convertedAmount = temp
    }
    
}
