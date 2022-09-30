//
//  ContentView.swift
//  BMI Calculator SwiftUI
//
//  Created by Kristanto Sean N on 26/04/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()

    let ageRange = Array(2...100)
    let genderRange = ["Male", "Female"]
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        Picker("Age", selection: $viewModel.ageFieldIndex) {
                            ForEach(ageRange, id:\.self) {
                                Text(String($0)).tag($0)
                            }
                        }

                        Picker("Gender", selection: $viewModel.genderFieldIndex) {
                            ForEach(genderRange, id:\.self) {
                                Text(String($0)).tag($0)
                            }
                        }.tint(Color.black)
                        
                        TextField(text: $viewModel.heightField, prompt: Text("Fill your height in cm"), label: {
                            Text("Height")
                        }).keyboardType(.numberPad)

                        TextField(text: $viewModel.weightField, prompt: Text("Fill your weight in kg"), label: {
                            Text("Weight")
                        }).keyboardType(.numberPad)

                        Button(action: {
                            viewModel.doCalculate()
                        }, label: {
                            Text("Calculate")
                        }).buttonStyle(DefaultButtonStyle())
                    }

                    Text("Result")
                    Text(viewModel.resultTitle).fixedSize(horizontal: false, vertical: true)
                    Text(viewModel.resultDescription).fixedSize(horizontal: false, vertical: true)
                }
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, nil)
            }.navigationTitle("BMI Calculator")
        }

        
    }
    


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
