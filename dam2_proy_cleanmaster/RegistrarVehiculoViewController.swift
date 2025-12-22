import UIKit

class RegistrarVehiculoViewController: UIViewController {
    @IBOutlet weak var txtPlaca: UITextField!
    @IBOutlet weak var txtModelo: UITextField!
    @IBOutlet weak var txtMarca: UITextField!
    @IBOutlet weak var txtAnio: UITextField!
    @IBOutlet weak var btnGuardar: UIButton!
    @IBOutlet weak var btnCancelar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func guardarDatos(_ sender: UIButton){
        let placa = txtPlaca.text!
        let modelo = txtModelo.text!
        let marca = txtMarca.text!
        let anio = txtAnio.text!
        
        let campos: [UITextField] = [txtPlaca, txtModelo, txtMarca, txtAnio]
        
        if !Utiles.validarCampos(campos: campos){
            Utiles.mostrarMensaje(controller: self, "Error: Al ingresar datos", "Los campos no tienen datos validos.")
            return
        }
        let service = VehiculoService()
        service.registrar(BEVehiculo(placa: placa, modelo: modelo, marca: marca, anio: Int(anio) ?? 0))
        Utiles.cambiarVista(controller: self, controllerName: "ClienteVehiculos")
    }
    
    @IBAction func regresarTap(_ sender: UIButton){
        Utiles.cambiarVista(controller: self, controllerName: "ClienteVehiculos")
    }
}
