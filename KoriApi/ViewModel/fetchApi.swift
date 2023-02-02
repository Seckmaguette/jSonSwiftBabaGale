//
//  fetchApi.swift
//  KoriApi
//
//  Created by Abdoulaye Aliou SALL on 26/01/2023.
//

import Foundation


class ListPerson: ObservableObject{
    @Published var people : [Person] = []
    
    //    func loadData(){
    //        print("bonjour je suis ici")
    //        if let url = Bundle.main.url(forResource: "jsonapi", withExtension: "json"){
    //            print("je suis \(url)")
    //            do {
    //                let data = try Data(contentsOf: url)
    //                print("je suis \(data)")
    //                let decoder = JSONDecoder()
    //                print("je decode avec \(decoder)")
    //                person = try decoder.decode([Person].self, from: data)
    //                print("voici tes donnee \(person)")
    //            }catch{
    //                print(error)
    //            }
    //
    //        }
    //    }
    //
    
    //    let url = Bundle.main.url(forResource: "kori", withExtension: "json")
    func loadData() {
        print(Bundle.main.url(forResource: "kori", withExtension: "json"))
        if let url = Bundle.main.url(forResource: "kori", withExtension: "json") {
            
            //            print("url :\(url)"  )
            do {
                let data = try Data(contentsOf: url)
                //                print("data\(data)")
                let decoder = JSONDecoder()
                //                print("decoder \(decoder)")
                people = try decoder.decode([Person].self, from: data)
                //                print("people\(people)")
                
            } catch {
                print("Error decoding data: \(error)")
            }
        }else{
            print("je suis sortie")
        }
    }
    
    
    
    // post request in API
    //    func validate(person : [Person]) {
    //        let url = Bundle.main.url(forResource: "kori", withExtension: "json")
    //        print("C'est moi valider je recupere : \([person])")
    //        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    //        if let directoryMmanager = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
    //            do{
    //                let encoderData = try JSONEncoder().encode([person])
    //               print("encoderData : \(encoderData)")
    //                let jsonString = String(data: encoderData, encoding: .utf8)
    //                let fileURL = directoryMmanager.appendingPathComponent("kori.json")
    //
    //                print("fileURL  : \(fileURL)")
    //                //try encoderData.write(to: fileURL)
    ////                print(jsonString)
    //                try encoderData.write(to: fileURL)
    //
    //            }catch{
    //                print("no data")
    //            }
    //
    //        }
    //
    //    }
    //}
    
    
    func validate(person: [Person]){
        print("je suis sur valider")
        if let url = Bundle.main.url(forResource: "kori", withExtension: "json"){
            do{
                let encoderData = try JSONEncoder().encode([person])
                let jsonString = String(data: encoderData, encoding: .utf8)
                print(jsonString)
                try encoderData.write(to: url)
                print(try encoderData.write(to: url))
            }catch{
                print("je peux pas poster car cette \(error)")
            }
        }else{
            print("je suis sortie car je vous pas le chemin")
        }
    }
}
    
//let encoder = JSONEncoder()
//if let data = try? encoder.encode(formData) {
//    if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
//        let fileURL = documentsDirectory.appendingPathComponent("koori.json")
//        do {
//            try data.write(to: fileURL)
//            print("File saved successfully!")
//
//        } catch {
//            print("Failed to save file: \(error.localizedDescription)")
//        }
//    }
//
//}
