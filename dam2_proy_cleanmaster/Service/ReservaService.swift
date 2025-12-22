import FirebaseFirestore

class ReservaService {
    var db = Firestore.firestore();
    
    func listarPorUsuario(usuarioId: String){
        // Listar por usuario
    }
    
    func registrarReserva(reserva: BEReserva){
        // registra nueva reserva
    }
    
    func buscarReserva(reservaId: String){
        // Buscar reserva por su id
    }
}
