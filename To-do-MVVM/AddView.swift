//
//  AddView.swift
//  To-do-MVVM
//
//  Created by Sai bharadwaj Adapa on 4/9/25.
//

import SwiftUI

struct AddView: View {
    
    @State var taskname : String = ""
    @EnvironmentObject var viewModel : ViewModel
    @Environment(\.presentationMode) var presentationMode
    
    func addTask(){
        viewModel.addItem(title: taskname)
        presentationMode.wrappedValue.dismiss()
    }
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(spacing: 20){
                    TextField("Enter the task", text: $taskname)
                        .font(.title2)
                        .textFieldStyle(.roundedBorder)
                  
                    Button {
                        addTask()
                    } label: {
                        Text("Save".uppercased())
                                               .foregroundColor(.white)
                                               .font(.headline)
                                               .frame(height: 55)
                                               .frame(maxWidth: .infinity)
                                               .background(Color.accentColor)
                                               .cornerRadius(10)
                    }

                   
                    
                    
                }
                .padding()
            }
            .navigationTitle("Add new Task ✍🏻")
        }
       
    }

}

#Preview {
    AddView()
        .environmentObject(ViewModel())
}
