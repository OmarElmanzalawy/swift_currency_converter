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
            LabeledTextField(viewModel: viewModel,isBaseCurrency: true ,title: "Amount")
            HStack{
                Spacer()
                Button {
                    viewModel.reverseConversion()
                } label: {
                    Image(systemName: "arrow.up.arrow.down")
                        .foregroundStyle(.black)
                        .font(.title2)
                        .fontWeight(.bold)
                }
                Spacer()
            }
            .padding(.vertical)
            LabeledTextField(viewModel: viewModel, isBaseCurrency: false,title: "Converted To")
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
