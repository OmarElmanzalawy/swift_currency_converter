//
//  ApiService.swift
//  CurrencyConvertor
//
//  Created by MAC on 03/06/2025.
//

import Foundation

final class ApiService{
    
    static func fetchExchangeRate()async -> Rates?{
        
        let baseUrl: String = "https://openexchangerates.org/api/latest.json?app_id=d2bffefef6e74f6f90cbb9b39e6fc27f"
        let url = URL(string: baseUrl)!
        let urlRequest = URLRequest(url: url)
        do{
            let (data,_) = try await URLSession.shared.data(for: urlRequest)
            guard let jsonResponse = try JSONSerialization.jsonObject(with: data) as? [String: Any] else{
                ViewModel.shared.erroMessage = "Could not fetch rates. Please try again later."
                return nil
            }
            
            print("Sucess")
            print(jsonResponse)
            
            ViewModel.shared.isLoading = false
            
            return try JSONDecoder().decode(Rates.self,from: data)
            
            
            
        }catch(let error){
            ViewModel.shared.erroMessage = "Could not fetch rates. Please try again later."
            print(error.localizedDescription)
            return nil
        }
        
        
    }
    
}


