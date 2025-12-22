import UIKit

class PagosController: UIViewController {
    @IBOutlet weak var btnRegresar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnRegresarTap(_ sender: UIButton){
        Utiles.cambiarVista(controller: self, controllerName: "Principal")
    }
}
