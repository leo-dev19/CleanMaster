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
    
    /*func buscarPorId(id: String) -> BEUsuario{
        let usuario: BEUsuario;
        db.collection(coleccion).getDocuments{
            (query, err) in
            if let err = err {
                print("Error obteniendo documento: \(err)")
            } else {
                for document in query!.documents{
                    if(document.documentID == id){
                        let usuario: BEUsuario = BEUsuario(
                        nombre: document.data()["nombre"] as! String,
                        apellido: document.data()["apellido"] as! String,
                        dni: document.data()["dni"] as! String,
                        email: document.data()["email"] as! String,
                        password: document.data()["password"] as! String)
                    }
                }
            }
        }
        return usuario;
    }*/
    
    func registrar(nombre: String, apellido: String, dni: String, email: String, password: String){
        db.collection(coleccion).addDocument(data: ["nombre": nombre, "apellido": apellido, "dni": dni, "email": email, "password": password]) {
            (err) in
            if let err = err {
                print("Error al registrar usuario \(err)")
            }
        }
    }
}
