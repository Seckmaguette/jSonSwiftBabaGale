//
//  signUp.swift
//  KoriApi
//
//  Created by Abdoulaye Aliou SALL on 27/01/2023.
//

import SwiftUI

struct signUp: View {
    @ObservedObject var dataLoader = ListPerson()
    @State var username = ""
    @State var nomComplet: String = ""
    @State var email: String = ""
    @State var profession: String = ""
    @State var service: String = ""
    @State var departement: String = ""
    @State var direction: String = ""
    
    var body: some View {
        NavigationView() {
                ZStack {
                    Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
                    VStack(alignment: .leading){
                        Text("Create New User")
                            .font(Font.system(size: 16, weight: .bold))
                        
                        TextField("username", text: $username)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(6)
                            .padding(.bottom)
                        
                        TextField("Your name", text: $nomComplet)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(6)
                            .padding(.bottom)
                        
                        TextField("Your mail", text: $email)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(6)
                            .padding(.bottom)
                        
                        Picker("Service", selection: $service){
                            Text("SERVICE KOORI").tag("AB")
                            Text("SERVICE COMMERCIAL").tag("service commercial")
                            Text("SERVICE COMPTABLE").tag("Service Comptable")
                            Text("Service RH").tag("Service des ressource humaine")
                        }.pickerStyle(.navigationLink)
                        Picker("\nProfession", selection: $profession){
                            Text("Informatique").tag("informaticien")
                            Text("Docteur").tag("Docteur")
                            Text("Comptablite").tag("Comptble")
                            Text("Programmation").tag("programmeur")
                        }.pickerStyle(.navigationLink)
                        
                        Picker("Selection votre departement", selection: $departement){
                            Text("SERVICE KOORI").tag("SILAB")
                            Text("SERVICE COMMERCIAL").tag("service commercial")
                            Text("SERVICE COMPTABLE").tag("Service Comptable")
                            Text("Service RH").tag("Service des ressource humaine")
                        }.pickerStyle(.wheel)
                        
                        Picker("Selection votre direction", selection: $direction){
                            Text("DSI").tag("dsi")
                            Text("DSC").tag("dsc")
                            Text("DC").tag("dc")
                            Text("DRH").tag("drh")
                        }.pickerStyle(.segmented)

                        Button {
                             dataLoader.people.append(Person(id: 1, avatar: nomComplet, nomComplet: nomComplet, email: email, profession: profession, service: service, departement: departement, direction: direction))
                            print("vous avez ajoutez \([dataLoader.people]) maintenant je l'evoie sur valider")
                            
                                dataLoader.validate(person: dataLoader.people)
                            
                                    print("deja envoyé")
                               
//                            print("\(dataLoader.people)")
                                } label: {
                                    Text("Validate")
                                }.buttonStyle(.bordered)
                        Spacer()
                    }.padding()
                }
                .navigationBarTitle("New User", displayMode: .inline)
            
                           }
        
    }
    
}

struct signUp_Previews: PreviewProvider {
    static var previews: some View {
        signUp()
    }
}
