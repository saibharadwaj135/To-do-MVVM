//
//  ContentView.swift
//  To-do-MVVM
//
//  Created by Sai bharadwaj Adapa on 4/9/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State var isAnimate : Bool = false;
    var body: some View {
        NavigationView {
            VStack{
                Spacer()
                
                if( viewModel.items.count > 0 ){
                    List{
                        ForEach(viewModel.items){ item in
                            Text(item.text)
                        }.onDelete(perform: viewModel.deleteItem)
                        .onMove(perform: viewModel.moveItem)
                    }
                }
                else{
                    Text("No more things to do 😅")
                        .font(.largeTitle)
                    NavigationLink {
                        AddView()
                    } label: {
                        
                        Text("Add Something 🥳")
                                                 .foregroundColor(.white)
                                                 .font(.headline)
                                                 .frame(height: 60)
                                                 .frame(maxWidth: isAnimate ? .infinity : 200)
                                                 .background(isAnimate ? .orange : Color.accentColor)
                                                 .cornerRadius(10)
                                                 .animation(.easeIn(duration: 2).repeatForever(), value: isAnimate)
                                                 .offset(y: isAnimate ? 0 : 55)
                                                
                           
                    }.padding()
                    .onAppear{
                            isAnimate.toggle()
                        }
                    

                }
               
                
                Spacer()
                Spacer()
            }
            .navigationTitle("Things to do 📝")
            .navigationBarItems(leading: EditButton(),
                trailing: NavigationLink(destination: {
                AddView()
            }, label: {
                Image(systemName: "plus")
            }))
            
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ViewModel())
}
