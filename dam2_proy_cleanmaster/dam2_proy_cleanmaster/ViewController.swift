import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btnIniciarSesion: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btnIniciar(_ sender: UIButton){
        let board = UIStoryboard(name: "Main", bundle: nil)
        let viewController = board.instantiateViewController(identifier: "RegistrarUsuario") as! RegistrarUsuarioViewController
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
        //Utiles.cambiarVista(controller: self, controllerName: "RegistrarUsuarioViewController")
    }
}

