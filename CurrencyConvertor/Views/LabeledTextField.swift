//
//  LabeledTextField.swift
//  CurrencyConvertor
//
//  Created by MAC on 29/04/2025.
//

import SwiftUI

struct LabeledTextField: View {
    
    @Binding var amount: String
    
    let viewModel: ViewModel
//    let numberFormatter: NumberFormatter
    let title: String
//    let currency: CurrencyChoice
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
            TextField("", value: $amount, formatter: viewModel.numberFormatter)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.clear)
                        .stroke(.gray, style: StrokeStyle(lineWidth: 1))
                }
                .overlay(alignment: .trailing) {
                    HStack{
                        title == "Amount" ? viewModel.baseCuurency.image() : viewModel.convertedCurrency.image()
//                        currency.image()
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30,height: 30)
                            .clipShape(Circle())
                        Menu{
                            ForEach(CurrencyChoice.allCases){currency in
                                Button {
                                    
                                } label: {
                                    Text(currency.rawValue)
                                }

                            }
                        }label: {
                            Text(title == "Amount" ? viewModel.baseCuurency.rawValue : viewModel.convertedCurrency.rawValue)
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
    LabeledTextField(amount: .constant(""),viewModel: ViewModel(), title: "Title")
}
