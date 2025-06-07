//
//  ContentView.swift
//  CurrencyConvertor
//
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel.shared
    
    @FocusState private var isBaseCurrencyFocused: Bool
    @FocusState private var isConvertedCurrencyFocused: Bool
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading){
                HStack{
                    Spacer()
                    Text(viewModel.erroMessage)
                        .foregroundStyle(.red)
                        .font(.system(size: 18,weight: .semibold))
                    Spacer()
                }
                LabeledTextField(viewModel: viewModel,isFocused: $isBaseCurrencyFocused,isBaseCurrency: true ,title: "Amount")
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
                LabeledTextField(viewModel: viewModel, isFocused: $isConvertedCurrencyFocused,isBaseCurrency: false,title: "Converted To")
                HStack{
                    Spacer()
                    Text("1.0000 \(viewModel.baseCuurency.rawValue) = \(viewModel.conversionRate) \(viewModel.convertedCurrency.rawValue)")
                        .font(.system(size: 18,weight: .semibold))
                        .padding(.top, 25)
                    Spacer()
                }.padding(.bottom,25)
                Button {
                    viewModel.convert()
                    isBaseCurrencyFocused = false
                    isConvertedCurrencyFocused = false
                }label:{
                    Text("Convert")
                        .frame(maxWidth: .infinity,minHeight: 45,alignment: .center)
                        .foregroundStyle(.white)
                        .font(.system(size: 17,weight: .semibold))
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            .padding()
            .task {
                //temporarily disabled
                await viewModel.fetchRates()
            }
            if viewModel.isLoading {
                ZStack {
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                    ProgressView()
                        .tint(.white)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
