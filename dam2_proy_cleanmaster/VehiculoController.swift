import UIKit

class VehiculoController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var btnRegresar: UIButton!
    @IBOutlet weak var tbVehiculos: UITableView!
    @IBOutlet weak var btnRegistrar: UIButton!
    let service = VehiculoService()
    var vehiculos: [BEVehiculo] = [] {
        didSet {
            tbVehiculos.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbVehiculos.delegate = self
        tbVehiculos.dataSource = self
        obtenerVehiculos()
    }
    
    func obtenerVehiculos(){
        //DispatchQueue.main.async {
        /*self.service.listar { [weak self] lista in
            DispatchQueue.main.async {
                self?.vehiculos = lista;
            }
        }*/
        Task {
            let lista = try await self.service.listar();
            self.vehiculos = lista;
        }
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
    
    @IBAction func btnRegistrarVehiculoTap(_ sender: UIButton){
        Utiles.cambiarVista(controller: self, controllerName: "RegistrarVehiculo")
    }
}
