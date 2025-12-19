import FirebaseFirestore

class VehiculoService {
    var db = Firestore.firestore()
    let coleccion: String = "vehiculos"
    
    func listar() -> [BEVehiculo]{
        var lista = [BEVehiculo]()
        
        db.collection(coleccion).getDocuments() {
            snapshot, error in
            if let error = error {
                print("Error getting documents: \(error)")
            }
            lista.removeAll()
            snapshot?.documents.forEach {
                document in
                let data = document.data()
                let vehiculo = BEVehiculo(
                    placa: data["placa"] as? String ?? "",
                    modelo: data["modelo"] as? String ?? "",
                    marca: data["marca"] as? String ?? "",
                    anio: data["anio"] as? Int ?? 0)
                lista.append(vehiculo)
                
            }
        }
        return lista
    }
    
    func guardar(_ vehiculo: BEVehiculo){
        db.collection(coleccion).addDocument(data:
                    ["marca": vehiculo.marca, "modelo": vehiculo.modelo,
                    "placa": vehiculo.placa, "anio": vehiculo.anio]) {
            error in
            if let error = error {
                print("Error getting documents: \(error)")
            }else {
                print("Se guardo el vehiculo "+vehiculo.placa)
            }
        }
    }
    
    func eliminar(_ placa: String){
        
    }
    
    func buscar(_ placa: String) -> BEVehiculo{
        return BEVehiculo(placa: "", modelo:"", marca:"", anio: 2025)
    }
}
