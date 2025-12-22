import FirebaseFirestore

class PagoService {
    var db: Firestore
    
    init(db: Firestore = Firestore.firestore()) {
        self.db = db
    }
    
    func listarPorUsuario(usuarioId: String){
        // Devuelve una lista de pagos por el usuario
    }
    
    func registrarPago(pago: BEPago, usuarioID: String){
        //Registra pago
    }
    
    func buscarPago(pagoId: String){
        //Devuelve un pago con pagoId
    }
}
