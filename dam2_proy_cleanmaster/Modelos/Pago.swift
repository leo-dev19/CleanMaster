import Foundation
import FirebaseFirestore

struct BEPago: Codable, Identifiable {
    @DocumentID var id: String?
    var num: Int
    var vehiculoPlaca: String
    var reservaCodigo: Int
    var serviciosUsados: Int
    var nombreUsuario: String
    var monto: Double
    
    init(id: String? = nil, num: Int, vehiculoPlaca: String, reservaCodigo: Int, serviciosUsados: Int, nombreUsuario: String, monto: Double) {
        self.id = id
        self.num = num
        self.vehiculoPlaca = vehiculoPlaca
        self.reservaCodigo = reservaCodigo
        self.serviciosUsados = serviciosUsados
        self.nombreUsuario = nombreUsuario
        self.monto = monto
    }
}
