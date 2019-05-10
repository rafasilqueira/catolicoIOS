//
//  OracaoContentViewController.swift
//  catolico
//
//  Created by Rafael Silqueira Tupinamba on 21/10/2018.
//  Copyright © 2018 Rafael Silqueira. All rights reserved.
//

import UIKit

class OracaoContentViewController : UIViewController{
    
    let swipeLeft = UISwipeGestureRecognizer()
    var oracao : Oracao?
    
    @IBOutlet weak var txtOracao: UILabel!
    
    @IBOutlet weak var txtOracaoContent: UITextView!
    
    @IBAction func backSegue() {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swipeLeft.addTarget(self, action: #selector(self.backSegue) )
        swipeLeft.direction = .right
        self.view!.addGestureRecognizer(swipeLeft)
        txtOracao.text = oracao?.nome
        txtOracaoContent.text = oracao?.descricao

    }
}
