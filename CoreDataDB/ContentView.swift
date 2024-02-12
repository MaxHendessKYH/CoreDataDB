//
//  ContentView.swift
//  CoreDataDB
//
//  Created by Max.Hendess on 2024-02-12.
//

import SwiftUI

struct ContentView: View {
    //obesrved obj eller state obj
   @ObservedObject var viewModel = PersonViewModel()
    @State var name: String = ""
    @State var age: String = ""
    var body: some View {
        NavigationView{
            VStack {
                TextField("name", text: $name)
                    .padding()
                TextField("age" ,text: $age)
                    .padding()
                Button("Add Person"){
                    addPerson()
                }.padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                List{
                    ForEach(viewModel.persons){entity in
                        NavigationLink{
                            EditPerson(entity: entity, viewModel: viewModel)
                            //        Text(entity.name ?? " no name ")
                          //  Text(entity.age ?? " no age")
                        } label: {
                            Text(entity.name ?? " no name ")
                        }
                    }.onDelete(perform:
                        viewModel.deletePerson
                    )
                }
                
            }
            .padding()
        }
    }
    func addPerson(){
        if name.isEmpty {
            return
        }
        if age.isEmpty {
         return
        }
        viewModel.addPerson(name: name, age: Int(age) ?? 0)
        age = ""
        name = ""
    }
}

#Preview {
    ContentView()
}
