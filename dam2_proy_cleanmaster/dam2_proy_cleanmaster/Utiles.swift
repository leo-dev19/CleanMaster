import UIKit

class Utiles {
    static func validarCampos(campos: [UITextField]) -> Bool{
        for campo in campos {
            let value = campo.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
            if value.isEmpty { return false}
        }
        return true;
    }
    
    static func limpiarCampos(campos: [UITextField]) {
        for campo in campos {
            campo.text = ""
        }
    }
    
    static func mostrarMensaje(controller: UIViewController, _ titulo: String, _ mensaje: String, acciones: [UIAlertAction]){
        let alerta = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        
        if(!acciones.isEmpty) {
            for accione in acciones {
                alerta.addAction(accione)
            }
        }else{
            alerta.addAction(UIAlertAction(title: "ACEPTAR", style: .default))
        }
        
        controller.present(alerta, animated: true)
    }
    
    static func mostrarMensaje(controller: UIViewController, _ titulo: String, _ mensaje: String){
        let acciones: [UIAlertAction] = []
        mostrarMensaje(controller: controller, titulo, mensaje, acciones: acciones)
    }
    
    static func cambiarVista(controller: UIViewController, controllerName: String){
        let board = UIStoryboard(name: "Main", bundle: nil)
        let viewController = board.instantiateViewController(identifier: controllerName)
        viewController.modalPresentationStyle = .fullScreen
        controller.present(viewController, animated: true)
    }
    
    static func cambiarVista(controller: UIViewController, controllerTo: UIViewController){
        controllerTo.modalPresentationStyle = .fullScreen
        controller.present(controllerTo, animated: true)
    }
    
    static func cerrarSesion(controller: UIViewController){
        cambiarVista(controller: controller, controllerName: "IniciarSesion")
    }
}
