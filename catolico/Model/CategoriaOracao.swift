//
//  CategoriaOracao.swift
//  catolico
//
//  Created by Rafael Silqueira on 16/09/2018.
//  Copyright © 2018 Rafael Silqueira. All rights reserved.
//

class CategoriaOracao: Codable{
    var id: Int
    var nome : String
    
    init(id:Int,nome:String) {
        self.id=id
        self.nome=nome
    }
    
}
