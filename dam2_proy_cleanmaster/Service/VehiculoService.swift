import FirebaseFirestore

class VehiculoService {
    var db = Firestore.firestore()
    let coleccion: String = "vehiculos"
    
    func listar() async throws -> [BEVehiculo]{
        let snapshot = try await db.collection(coleccion).getDocuments()
        return snapshot.documents.map {
            document in
            let data = document.data()
            return BEVehiculo(
                    placa: data["placa"] as? String ?? "",
                    modelo: data["modelo"] as? String ?? "",
                    marca: data["marca"] as? String ?? "",
                    anio: data["anio"] as? Int ?? 0)
        }
    }
    
    func registrar(_ vehiculo: BEVehiculo){
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
    
    func buscar(_ id: String) -> BEVehiculo{
        let docut = db.collection(coleccion).document(id)
        
        docut.getDocument { (document, error) in
                if let error = error {
                    print("Error getting document: \(error.localizedDescription)")
                } else {
                    do {
                        let user = try document?.data(as: BEVehiculo.self)
                        if let user = user {
                            print("Fetched user: \(user.name), ID: \(user.id ?? "N/A")")
                        } else {
                            print("Document data was empty or unmappable")
                        }
                    } catch {
                        print("Error decoding document: \(error)")
                    }
                }
            }
        return BEVehiculo(placa: "", modelo:"", marca:"", anio: 2025)
    }
}
