//
//  ContentView.swift
//  CurrencyConvertor
//
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel.shared
    
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
                }.padding(.bottom,25)
               
                Button {
                    viewModel.convert()
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
