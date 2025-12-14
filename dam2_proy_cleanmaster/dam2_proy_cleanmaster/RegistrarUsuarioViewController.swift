import UIKit
import CoreData

class RegistrarUsuarioViewController: UIViewController {
    // Interface Builder
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtApellido: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtDNI: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnRegistrarse: UIButton!
    @IBOutlet weak var btnIniciarSesion: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnRegistrarseTap(_ sender: UIButton){
        let camposTxt: [UITextField] = [txtNombre, txtApellido, txtEmail, txtDNI, txtPassword]
        let nombre = txtNombre.text
        let apellido = txtApellido.text
        let email = txtEmail.text
        let dni = txtDNI.text
        let password = txtPassword.text
        
        if  !Utiles.validarCampos(campos: camposTxt) {
            Utiles.mostrarMensaje(controller: self, "Error: Al ingresar datos", "Los campos no tienen datos validos.")
            return
        }
        
        /*let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
        let usuario = Usuario(context: context)
        usuario.nombre = nombre
        usuario.apellido = apellido
        usuario.email = email
        usuario.dni = dni
        usuario.password = password*/
        
        /*do {
            try /*context.save()*/
            Utiles.limpiarCampos(campos: camposTxt)
            Utiles.mostrarMensaje(controller: self, "Limpio", "Campos limpios")
        } catch {
            Utiles.mostrarMensaje(controller: self, "Hubo un error", "No se pudo realizar la accion")
        }*/
        Utiles.limpiarCampos(campos: camposTxt)
        Utiles.mostrarMensaje(controller: self, "Limpio", "Campos limpios")
    }
    
    @IBAction func btnIniciarSesionTap(_ sender: UIButton){
        Utiles.cambiarVista(controller: self, controllerName: "IniciarSesion")
    }
}
