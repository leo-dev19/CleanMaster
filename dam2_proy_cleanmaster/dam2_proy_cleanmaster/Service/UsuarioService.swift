import Firebase

class UsuarioService {
    var db = Firestore.firestore()
    let coleccion = "usuarios";
    
    func listar() -> [BEUsuario] {
        var usuarios: [BEUsuario] = [];
        db.collection(coleccion).getDocuments { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let usuario: BEUsuario = BEUsuario(
        nombre: document.data()["nombre"] as! String,
        apellido: document.data()["apellido"] as! String,
        dni: document.data()["dni"] as! String,
        email: document.data()["email"] as! String,
        password: document.data()["password"] as! String
                    )
                    usuarios.append(usuario)
                }
            }
        }
        return usuarios;
    }
}
