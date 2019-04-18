//
//  PersonModel.swift
//  GimnasioPollo
//
//  Created by Mike on 4/15/19.
//  Copyright © 2019 UTNG. All rights reserved.
//

class PersonModel {
    
    var id: String?
    var name: String?
    var ege: String?
    var peso: String?
    var alt: String?
    var address: String?
    
    init(id: String?, name: String?, ege: String?,peso: String?,alt: String?, address: String?){
        self.id = id
        self.name = name
        self.ege = ege
        self.peso = peso
        self.alt = alt
        self.address = address
    }
}
