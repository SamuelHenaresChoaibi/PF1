/**
 * Classe Client:
 * Pel que fa als clients, només ens interessa tenir la seva fitxa personal i la informació per gestionar els seus préstecs.
 * 
 * 
 * Atributs:
 * dni (privat)
 * nomComplet
 * correuElectronic
 * telefon
 * numCarnetBiblioteca
 * 
 * 
 * Constructors
 * Constructor amb dni i nomComplet. La resta d’atributs a null o buit.
 * Constructor amb tots els atributs.
 * 
 * 
 * Mètodes
 * Getters i setters de tots els atributs.
 * toString() sobreescrit per mostrar la informació del client.

*/
class Cliente {
  String _dni;
  String nombreCompleto;
  String? correoElectronico;
  String? telefono;
  String? numCarnetBihlioteca;

  Cliente(this._dni, this.nombreCompleto);
  Cliente.conDatosCompletos(
    this._dni,
    this.nombreCompleto,
    this.correoElectronico,
    this.telefono,
    this.numCarnetBihlioteca,
  );

  String get getDni => _dni;
  set dni(String dni) {
    _dni = dni;
  }

  String get getNombreCliente => nombreCompleto;
  set nombreCliente(String nombreCompleto) {
    this.nombreCompleto = nombreCompleto;
  }

  String? get getEmail => correoElectronico;
  set email(String? correoElectronico) {
    this.correoElectronico = correoElectronico;
  }

  String? get getTelefonoCliente => telefono;
  set telefonoCliente(String? telefono) {
    this.telefono = telefono;
  }

  String? get getCarnetBiblioteca => numCarnetBihlioteca;
  set carnetBiblioteca(String? numCarnetBihlioteca) {
    this.numCarnetBihlioteca = numCarnetBihlioteca;
  }

  @override
  String toString() {
    return 'DNI: $_dni, Nombre Completo: $nombreCompleto, Correo Electrónico: $correoElectronico, Teléfono: $telefono, Nº Carnet Biblioteca: $numCarnetBihlioteca}';
  }
}