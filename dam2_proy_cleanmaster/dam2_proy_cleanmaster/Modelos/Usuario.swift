import Foundation
import FirebaseFirestore

struct BEUsuario: Codable, Identifiable {
    @DocumentID var id: String?
    var nombre: String
    var apellido: String
    var dni: String
    var email: String
    var password: String
    
    init(id: String? = nil, nombre: String, apellido: String, dni: String, email: String, password: String) {
        self.id = id
        self.nombre = nombre
        self.apellido = apellido
        self.dni = dni
        self.email = email
        self.password = password
    }
}
