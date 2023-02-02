//
//  ContentView.swift
//  KoriApi
//
//  Created by Abdoulaye Aliou SALL on 26/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            PersonList()
        }
        .padding()
    }
    struct PersonList: View{
        @ObservedObject var dataLoader = ListPerson()
        @State var isLinkActive = false
        @State private var showModal = false
        
        var body: some View{
            
            Text("koori")
                .font(.largeTitle)
                .fontWeight(.bold)
            List(dataLoader.people){person in
             
                    HStack {
                        AsyncImage(url: URL(string: "\(person.avatar)")){ image in
                            image.resizable()
                                .resizable()
                                .cornerRadius(30)
                            
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                        Text(person.nomComplet)
                        Spacer()
//                        Text(person.Profil.libelle)
                        
                        
                    }
            }.onAppear{
                self.dataLoader.loadData()
            }
            Button(" SignUp") {
                             self.showModal = true
                         }
                         .sheet(isPresented: $showModal) {
                             signUp()
                         }
                    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
