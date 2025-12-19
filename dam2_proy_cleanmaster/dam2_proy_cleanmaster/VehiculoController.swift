import UIKit

class VehiculoController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var btnRegresar: UIButton!
    @IBOutlet weak var tbVehiculos: UITableView!
    var vehiculos = [BEVehiculo]()
    var service = VehiculoService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbVehiculos.delegate = self
        tbVehiculos.dataSource = self
        obtenerVehiculos()
    }
    
    func obtenerVehiculos(){
        DispatchQueue.main.async {
            self.service.listar().forEach{ vehiculo in
                print("\(vehiculo.id ?? "") \(vehiculo.placa) \(vehiculo.marca)")
            }
            self.vehiculos = self.service.listar()
            self.tbVehiculos.reloadData()
        }
        /*
        let url = URL(string: "https://dummyjson.com/quotes")!
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if let error = error {
                print("Error: ", error)
                return
            }
            guard let data = data else { return }
            do { //Esto carga los datos
                let resultado = try JSONDecoder().decode(QuotesResponse.self, from: data)
                self.quotes = resultado.quotes
                DispatchQueue.main.async {
                    self.tbVehiculos.reloadData()
                }
            }
            catch {
                print("Error al obtener datos", error)
            }
        }
        task.resume()*/
        /* //Esto lo ejecuta en otro hilo
         DispatchQueue.global(qos: .background).async {
            for _ in 1...10 {
                print("Tarea 1")
                sleep(1)
            }
         }
         */
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehiculos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaVehiculo") as! VehiculoCeldaTabla
        let quote = vehiculos[indexPath.row];
        celda.lblModelo.text = quote.modelo
        celda.lblPlaca.text = quote.placa
        return celda
    }

    @IBAction func btnRegresarTap(_ sender: UIButton){
        Utiles.cambiarVista(controller: self, controllerName: "Principal")
    }
}
