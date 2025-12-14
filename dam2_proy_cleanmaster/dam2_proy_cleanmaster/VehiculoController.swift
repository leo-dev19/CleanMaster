import UIKit

class VehiculoController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var btnRegresar: UIButton!
    @IBOutlet weak var tbVehiculos: UITableView!
    var quotes = [Quote]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func obtenerVehiculos(){
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
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0//usuarios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaVehiculo") as! UsuarioTableViewCell
        return celda
    }

    @IBAction func btnRegresarTap(_ sender: UIButton){
        Utiles.cambiarVista(controller: self, controllerName: "Principal")
    }
}
