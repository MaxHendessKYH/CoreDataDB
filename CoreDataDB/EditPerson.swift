//
//  EditPerson.swift
//  CoreDataDB
//
//  Created by Max.Hendess on 2024-02-12.
//

import SwiftUI

struct EditPerson: View {
    var entity: Person
    @State var name: String = ""
    @State var age: String = ""
    @ObservedObject var viewModel: PersonViewModel
    var body: some View {
        TextField("name", text: $name)
            .padding()
        TextField("age" ,text: $age)
            .padding()
        Button("UPDATE Person"){
            updatePerson()
        }.padding()
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(20)

        Text(entity.name ?? "")
        Text(String(entity.age))
    }
    
    func updatePerson(){
        viewModel.updatePerson(entity : entity, name: name, age: Int(age) ?? 0)
        if name.isEmpty {
            return
        }
        if age.isEmpty {
         return
        }
        age = ""
        name = ""
    }
}
