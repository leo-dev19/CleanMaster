import UIKit

class ReservasController: UIViewController {
    @IBOutlet weak var btnRegresar: UIButton!
    @IBOutlet weak var btnRegistrar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnRegresarTap(_ sender: UIButton){
        Utiles.cambiarVista(controller: self, controllerName: "Principal")
    }
    
    @IBAction func registrarTap(_ sender: UIButton){
        Utiles.cambiarVista(controller: self, controllerName: "RegistrarReserva")
    }
}
