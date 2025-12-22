//
//  RegistrarReservaViewController.swift
//  dam2_proy_cleanmaster
//
//  Created by DAMII on 21/12/25.
//

import UIKit

class RegistrarReservaViewController: UIViewController {
    @IBOutlet weak var btnAgregarServicio: UIButton!
    @IBOutlet weak var btnGuardar: UIButton!
    @IBOutlet weak var btnCancelar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func agregarServicio(_ sender: UIButton){
        
    }
    
    @IBAction func guardarTap(_ sender: UIButton){
        
    }
    
    @IBAction func cancelarTap(_ sender: UIButton){
        Utiles.cambiarVista(controller: self, controllerName: "ClienteReservas")
    }
}
