import UIKit
import CoreData

class UsuariosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var usuariosTb: UITableView!
    @IBOutlet weak var btnBuscar: UIButton!
    @IBOutlet weak var btnRegresar: UIButton!
    @IBOutlet weak var txtBuscar: UITextField!
    var usuarios: [Usuario]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usuariosTb.delegate = self
        usuariosTb.dataSource = self
        
        cargarUsuarios()
    }
    
    @IBAction func btnBuscarUsuario(_ sender: UIButton){
        /*let board = UIStoryboard(name: "Main", bundle: nil)
        let viewController = board.instantiateViewController(identifier: "RegistrarUsuarioViewController") as! RegistrarUsuarioViewController*/
        
        Utiles.cambiarVista(controller: self, controllerName: "RegistrarUsuarioViewController")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usuarios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaUsuario") as! UsuarioTableViewCell
        let usuario = usuarios[indexPath.row];
        celda.lblID.text = "\(usuario.id)"
        celda.lblDNI.text = usuario.dni
        celda.lblNombreCompleto.text = "\(usuario.apellido ?? ""), \(usuario.nombre ?? "")"
        return celda
    }
    
    func cargarUsuarios(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request: NSFetchRequest<Usuario> = Usuario.fetchRequest()
        do {
            usuarios = try context.fetch(request)
            usuariosTb.reloadData()
        } catch { print("No se pudo cargar la base de datos, vuelva a intentarlo")}
    }
}
