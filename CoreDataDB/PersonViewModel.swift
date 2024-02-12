//
//  PersonViewModel.swift
//  CoreDataDB
//
//  Created by Max.Hendess on 2024-02-12.
//

import Foundation
import CoreData

class PersonViewModel:ObservableObject{
    
    var container = Pesrsistance.shared.container
    @Published var persons: [Person] =  []
    
    init()
    {
        fetchPersons()
    }
    // CRUD create READ Update Delete
    
    //get all persons to list
    func fetchPersons(){
        let request = NSFetchRequest<Person>(entityName: "Person")
        do{
            persons = try container.viewContext.fetch(request)
        }catch let error{
            print("error fetching \(error)")
        }
    }
    // add new person
    func addPerson(name: String, age: Int){
        let newPerson = Person(context: container.viewContext)
        newPerson.name = name
        newPerson.age = Int16(age)
        saveData()
       
    }
    // delete existing person
    func deletePerson(_index: IndexSet){
        guard let  index = _index.first else {return}
        let entity = persons[index]
        container.viewContext.delete(entity)
    saveData()
    }
    // Update existing person
    func updatePerson(entity: Person, name: String, age: Int){
        entity.name = name
        entity.age = Int16(age)
        saveData()
    }
    // save data to database
    func saveData()
    {
        do{
            try container.viewContext.save()
        }catch let error{
            print("error adding \(error)")
        }
        fetchPersons()
    }
}
