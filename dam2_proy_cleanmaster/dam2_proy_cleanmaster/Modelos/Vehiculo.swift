struct BEVehiculo {
    var placa: String
    var modelo: String
    var marca: String
    var anio: Int
    
    init(placa: String, modelo: String, marca: String, anio: Int) {
        self.placa = placa
        self.modelo = modelo
        self.marca = marca
        self.anio = anio
    }
}
