struct BEUsuario {
    var nombre: String
    var apellido: String
    var dni: String
    var email: String
    var password: String
    init(nombre: String, apellido: String, dni: String, email: String, password: String) {
        self.nombre = nombre
        self.apellido = apellido
        self.dni = dni
        self.email = email
        self.password = password
    }
}
