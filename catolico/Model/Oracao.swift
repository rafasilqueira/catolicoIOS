//
//  Oracao.swift
//  catolico
//
//  Created by Rafael Silqueira on 16/09/2018.
//  Copyright © 2018 Rafael Silqueira. All rights reserved.
//

class Oracao: Codable{
    
    var id : Int
    var nome : String
    var descricao : String
    var categoriaOracao : CategoriaOracao
    var favorite : Bool = false
//
    
    init(id:Int,nome:String,descricao:String,categoria:CategoriaOracao) {
        self.id=id
        self.nome=nome
        self.descricao=descricao
        self.categoriaOracao=categoria
    }
}
