import Foundation
import FirebaseFirestore

struct BEReserva: Codable, Identifiable {
    @DocumentID var id: String?
    var codigo: String
    var estado: String
    var costo: Double
    var servicios: [String]
    var vehiculoPlaca: String
        
    init(id: String? = nil, codigo: String, estado: String, costo: Double, servicios: [String], vehiculoPlaca: String) {
        self.id = id
        self.codigo = codigo
        self.estado = estado
        self.costo = costo
        self.servicios = servicios
        self.vehiculoPlaca = vehiculoPlaca
    }
}
