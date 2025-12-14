import UIKit

class PrincipalViewController: UIViewController {
    @IBOutlet weak var btnVehiculos: UIButton!
    @IBOutlet weak var btnPagos: UIButton!
    @IBOutlet weak var btnReservas: UIButton!
    @IBOutlet weak var btnCerrarSesion: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnVehiculosTap(_ sender: UIButton){
        Utiles.cambiarVista(controller: self, controllerName: "ClienteVehiculos")
    }
    
    @IBAction func btnPagosTap(_ sender: UIButton){
        Utiles.cambiarVista(controller: self, controllerName: "ClientePagos")
    }
    
    @IBAction func btnReservasTap(_ sender: UIButton){
        Utiles.cambiarVista(controller: self, controllerName: "ClienteReservas")
    }
    
    @IBAction func cerrarSesion(_ sender: UIButton) {
        Utiles.cerrarSesion(controller: self)
    }
}
