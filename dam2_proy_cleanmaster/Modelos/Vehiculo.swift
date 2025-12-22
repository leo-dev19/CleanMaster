import Foundation
import FirebaseFirestore

struct BEVehiculo: Codable, Identifiable {
    @DocumentID var id: String?
    var placa: String
    var modelo: String
    var marca: String
    var anio: Int
    
    init(id: String? = nil, placa: String, modelo: String, marca: String, anio: Int) {
        self.id = id
        self.placa = placa
        self.modelo = modelo
        self.marca = marca
        self.anio = anio
    }
}
