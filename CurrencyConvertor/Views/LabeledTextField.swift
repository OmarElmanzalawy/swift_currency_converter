//
//  LabeledTextField.swift
//  CurrencyConvertor
//
//  Created by MAC on 29/04/2025.
//

import SwiftUI

struct LabeledTextField: View {
    
//    @Binding var amount: String
    
    @ObservedObject var viewModel: ViewModel
    @FocusState.Binding var isFocused: Bool
    let isBaseCurrency: Bool
    let title: String

    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
            TextField("", value: isBaseCurrency ? $viewModel.baseAmount : $viewModel.convertedAmount, formatter: viewModel.numberFormatter)
                .keyboardType(.numberPad)
                .padding()
                .focused($isFocused)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.clear)
                        .stroke(.gray, style: StrokeStyle(lineWidth: 1))
                }
                .overlay(alignment: .trailing) {
                    HStack{
                        (isBaseCurrency ? viewModel.baseCuurency.image() :
                            viewModel.convertedCurrency.image())
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30,height: 30)
                            .clipShape(Circle())
                        Menu{
                            ForEach(CurrencyChoice.allCases){currency in
                                Button {
                                    if(isBaseCurrency){
                                        viewModel.baseCuurency = currency
                                    }else{
                                        viewModel.convertedCurrency = currency
                                    }
                                } label: {
                                    Text(currency.fetchMenuName())
                                }

                            }
                        }label: {
                            Text(isBaseCurrency ? viewModel.baseCuurency.rawValue : viewModel.convertedCurrency.rawValue)
                                .fontWeight(.bold)
                                .foregroundStyle(.black)
                        }
                        Image(systemName: "chevron.down")
                            .foregroundStyle(.black)
                            .fontWeight(.bold)
                    }
                    .padding(.trailing)
                }
        }
    }
}

#Preview {
    @FocusState var isFocused: Bool
    LabeledTextField(viewModel: ViewModel(), isFocused: $isFocused,isBaseCurrency: true,title: "Title")
}
