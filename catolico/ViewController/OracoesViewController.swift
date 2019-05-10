//
//  SecondViewController.swift
//  catolico
//
//  Created by Rafael Silqueira on 25/08/2018.
//  Copyright © 2018 Rafael Silqueira. All rights reserved.
//

import UIKit
import Alamofire

class OracoesViewController: UIViewController, UITableViewDelegate , UITableViewDataSource{
    
    @IBAction func btnMenuItemFilter(_ sender: Any) {
        let alert = UIAlertController(title: "Selecione", message: "", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "A-Z", style: UIAlertAction.Style.destructive, handler: { action in
            print("Opa Opa Carpeado")
            
        }))
        
        alert.addAction(UIAlertAction(title: "Categoria", style: UIAlertAction.Style.destructive, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertAction.Style.cancel, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)

    }
   
    
    @IBOutlet weak var tableView: UITableView!
    
    let URL : String = "http://52.67.31.101:8080/oracoes/listar"
    let decoder = JSONDecoder()
    var oracoesList = [Oracao]()
    var oracao : Oracao?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        //tableView.contentInset = UIEdgeInsets(top: 44,left: 0,bottom: 0,right: 0);
        tableView.register(UINib(nibName: "PrayerRow", bundle: nil) , forCellReuseIdentifier: "PrayerRow")
        configureTableView()
        callAllOracoes()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seguePrayContent" {
            let destinationVC = segue.destination as! OracaoContentViewController
            destinationVC.oracao = oracao
            
        }
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        oracao = oracoesList[indexPath.row]
        let indexPath = tableView.indexPathForSelectedRow
        
        //getting the current cell from the index path
        let currentCell = tableView.cellForRow(at: indexPath!)! as! PrayerRow
        
        print(currentCell.txtOracao.text!)
        //tableView.deselectRowAtIndexPath(indexPath ??  nil, animated: true)
        performSegue(withIdentifier: "seguePrayContent", sender: self)
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 75.0;
    }
    
    func configureTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        //tableView.estimatedRowHeight = 120.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if tableView.dequeueReusableCell(withIdentifier: "PrayerRow") != nil{
            let cell = tableView.dequeueReusableCell(withIdentifier: "PrayerRow", for: indexPath) as! PrayerRow
            let oracao : Oracao = oracoesList[indexPath.row]
            cell.txtOracao.text = oracao.nome
            cell.txtCategoria.text = oracao.categoriaOracao.nome
            return cell
        }
        return UITableViewCell()
      
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return oracoesList.count
    }
    
    func callAllOracoes(){
        Alamofire.request(URL, method: .get, parameters: nil).responseJSON {
            response in
            if response.result.isSuccess {
                //print(response.result.value!)
                self.convertJson(jsonData: Data(response.data!))
                self.tableView.reloadData()
            }
            else {
                print("Error \(String(describing: response.result.error))")
            }
        }
    }
    
    
    func convertJson (jsonData : Data){
        do {
            oracoesList = try decoder.decode([Oracao].self, from: jsonData)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}

