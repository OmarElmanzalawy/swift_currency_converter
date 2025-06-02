//
//  ContentView.swift
//  CurrencyConvertor
//
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        VStack(alignment: .leading){
            LabeledTextField(amount: $viewModel.baseAmount,viewModel: viewModel, numberFormatter: viewModel.numberFormatter , title: "Amount",currency: viewModel.baseCuurency)
            HStack{
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "arrow.up.arrow.down")
                        .foregroundStyle(.black)
                        .font(.title2)
                        .fontWeight(.bold)
                }
                Spacer()
            }
            .padding(.vertical)
            LabeledTextField(amount: $viewModel.convertedAmount,viewModel: viewModel,numberFormatter: viewModel.numberFormatter ,title: "Converted To",currency: viewModel.convertedCurrency)
            HStack{
                Spacer()
                Text("1.0000 USD = 2.0000")
                    .font(.system(size: 18,weight: .semibold))
                    .padding(.top, 25)
                Spacer()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
