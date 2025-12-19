import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnIniciarSesion: UIButton!
    @IBOutlet weak var btnRegistrarse: UIButton!
    var camposTxt: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        camposTxt = [txtEmail, txtPassword]
    }
    
    @IBAction func btnIniciar(_ sender: UIButton){
        let usuarioS = UsuarioService()
        usuarioS.listar().forEach { print($0.nombre) }
        
        if  !Utiles.validarCampos(campos: camposTxt) {
            Utiles.mostrarMensaje(controller: self, "Error: Al ingresar datos", "Los campos no tienen datos validos.")
            return
        }
        
        Utiles.cambiarVista(controller: self, controllerName: "ClienteVehiculos")//"Principal")
    }

    @IBAction func btnRegistrar(_ sender: UIButton){
        Utiles.cambiarVista(controller: self, controllerName: "RegistrarUsuario")
    }
}

