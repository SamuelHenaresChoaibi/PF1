/*
  * Samuel Henares Choaibi
  * 78222723E
  * Programación Multimedia y Dispositivos Móviles
  * Curso 2025/2026
  * Proyecto PF1: Biblioteca Municipal
*/

/**
 * Aplicació principal (MAIN)
 * 
 * Un cop implementades les classes, crea un programa executable que faci el següent:
 * 
 * Crea dues llistes, una de llibres i una altra de revistes, de 5 posicions cadascuna.
 * 
 * Inicialitza 5 llibres i 5 revistes emprant els diferents constructors i afegeix-los a les seves respectives llistes.
 * 
 * Crea un o varis clients per a que puguin “sol·licitar” llibres i revistes.
 * 
 * Realitza el préstec d’alguns llibres i revistes amb el mètode prestar() als clients creats.
 * 
 * Compta quants llibres i quantes revistes hi ha prestades i digues quants tipus hi ha prestats en total.
 * 
 * Indica quin llibre és el més antic (any de publicació més baix) i quina revista és la més recent. Mostra’ls per pantalla amb tota la seva informació (toString()).

 */
void main(){
  List<Libro> listaLibros = new List<Libro>.filled(5, Libro());
  List<Revista> listaRevistas = new List<Revista>.filled(5, Revista());

  //Libros
  listaLibros[0] = Libro.soloIdTitulo("L1", "Las 48 Leyes del Poder");
  listaLibros[0].setAutor = "Robert Greene";
  listaLibros[0].setAnoPublicacion = 1998;
  listaLibros[0].setNumPaginas = 452;
  listaLibros[0].setGenero = "Autoayuda/Estrategia";

  listaLibros[1] = Libro.conDatosCompletos("L2", "El Manifiesto Comunista", "Karl Marx y Friedrich Engels", 1848, false, null, 48, "Filosofía Política");

  listaLibros[2] = Libro();
  listaLibros[2].setId = "L3";
  listaLibros[2].setTitulo = "La Abolición del Trabajo";
  listaLibros[2].setAutor = "Bob Black";
  listaLibros[2].setAnoPublicacion = 1985;
  listaLibros[2].setNumPaginas = 32;
  listaLibros[2].setGenero = "Anarquismo/Ensayos";

  listaLibros[3] = Libro.soloIdTitulo("L4", "El Arte de la Guerra");
  listaLibros[3].setAutor = "Sun Tzu";
  listaLibros[3].setAnoPublicacion = -500;
  listaLibros[3].setNumPaginas = 273;
  listaLibros[3].setGenero = "Estrategia Militar";

  listaLibros[4] = Libro.conDatosCompletos('L5', 'Así Habló Zaratustra', 'Friedrich Nietzsche', 1883, false, null, 327, 'Filosofía');

  //Revistas
  listaRevistas[0] = Revista.soloIdTitulo("R1", "Adbusters");
  listaRevistas[0].setAutor = "Varios";
  listaRevistas[0].setAnoPublicacion = 1989;
  listaRevistas[0].setNumero = 1;
  listaRevistas[0].setPeriodicidad = "Bimestral";

  listaRevistas[1] = Revista.conDatosCompletos("R2", "Jacobin", "Varios", 2010, false, null, 1, "Trimestral");

  listaRevistas[2] = Revista();
  listaRevistas[2].setId = "R3";
  listaRevistas[2].setTitulo = "Reason";
  listaRevistas[2].setAutor = "Varios";
  listaRevistas[2].setAnoPublicacion = 1968;
  listaRevistas[2].setNumero = 1;
  listaRevistas[2].setPeriodicidad = "Mensual";

  listaRevistas[3] = Revista.soloIdTitulo("R4", "Mother Jones");
  listaRevistas[3].setAutor = "Varios";
  listaRevistas[3].setAnoPublicacion = 1976;
  listaRevistas[3].setNumero = 1;
  listaRevistas[3].setPeriodicidad = "Bimestral";

  listaRevistas[4] = Revista.conDatosCompletos("R5", "National Review", "Varios", 1955, false, null, 1, "Quincenal");

  //Clientes
  Cliente cliente1 = Cliente.conDatosCompletos("78222723E", "Samuel Henares", "shc@gmail.com", "666777888", "CB12345"); 
  Cliente cliente2 = Cliente.conDatosCompletos("12345678A", "Adrian Plaza", "apr@gmail.com", "123456789", "CB54321");
  Cliente cliente3 = Cliente("87654321B", "Wisdom Imade");
  cliente3.email = "wi@gmail.com";
  cliente3.telefonoCliente = "987654321";
  cliente3.carnetBiblioteca = "CB67890";

  //Préstamos
  listaLibros[0].prestar(cliente1.getDni);
  listaLibros[3].prestar(cliente2.getDni);
  listaLibros[4].prestar(cliente3.getDni);
  listaRevistas[0].prestar(cliente1.getDni);
  listaRevistas[2].prestar(cliente2.getDni);
  listaRevistas[4].prestar(cliente3.getDni);

  //Contar préstamos
  int contadorPrestamosLibros = 0;
  int contadorPrestamosRevistas = 0;
  for (var libro in listaLibros) {
    if(libro.estaPrestado()){
      contadorPrestamosLibros++;
    }
  }

  for (var revista in listaRevistas) {
    if(revista.estaPrestado()){
      contadorPrestamosRevistas++;
    }
  }

  int totalPrestamos = contadorPrestamosLibros + contadorPrestamosRevistas;
  print('\nTotal de revistas prestadas: $contadorPrestamosRevistas');
  print('Total de libros prestados: $contadorPrestamosLibros');
  print('Total de prestamos: $totalPrestamos');

  //Libro más antiguo
  Libro libroMasAntiguo = listaLibros[0];
  for (var libro in listaLibros) {
    if(libro.getAnoPublicacion < libroMasAntiguo.getAnoPublicacion){
      libroMasAntiguo = libro;
    }
  }

  //Revista más reciente
  Revista revistaMasReciente = listaRevistas[0];
  for (var revista in listaRevistas) {
    if(revista.getAnoPublicacion > revistaMasReciente.getAnoPublicacion){
      revistaMasReciente = revista;
    }
  }

  print('\nEl libro más antiguo es: ${libroMasAntiguo.toString()}');
  print('\nLa revista más reciente es: ${revistaMasReciente.toString()}');
}


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
    return 'Cliente{dni: $_dni, nombreCompleto: $nombreCompleto, correoElectronico: $correoElectronico, telefono: $telefono, numCarnetBihlioteca: $numCarnetBihlioteca}';
  }
}

/**
 * Classe abstracta Tipus:
 * Llibres i revistes comparteixen molts atributs i mètodes. Per això, primer crearem una classe abstracta Tipus amb les característiques comunes.
 * Atributs
 * id (codi identificatiu)
 * titol
 * autor
 * anyPublicacio
 * prestat (per defecte = false)
 * dniClient (qui ha llogat el tipus, inicialment null)
 * 
 * 
 * Constructors
 * Constructor per defecte sense atributs.
 * Constructor amb només id i titol. La resta amb valors per defecte.
 * Constructor amb tots els atributs.
 * 
 *  
 * Mètodes
 * Getters i setters de tots els atributs.
 * toString() sobreescrit.
 * prestar(String dni) → canvia prestat = true i assigna dniClient.
 * retornar() → canvia prestat = false i posa dniClient = null.
 * estaPrestat() → retorna l’estat de l’atribut prestat.
 * compareTo(Object a) → compara l’any de publicació de dos tipus només si són de la mateixa subclasse (dos llibres, o dues revistes).
 */
abstract class Tipos {
  String id;
  String titulo;
  String autor;
  int anoPublicacion;
  bool prestado;
  String? dniCliente;

  Tipos()
    : id = '',
      titulo = '',
      autor = '',
      anoPublicacion = 0,
      prestado = false,
      dniCliente = null;

  Tipos.soloIdTitulo(this.id, this.titulo)
    : autor = '',
      anoPublicacion = 0,
      prestado = false,
      dniCliente = null;

  Tipos.conDatosCompletos(
    this.id,
    this.titulo,
    this.autor,
    this.anoPublicacion,
    this.prestado,
    this.dniCliente,
  );

  String get getId => id;
  set setId(String id) {
    this.id = id;
  }

  String get getTitulo => titulo;
  set setTitulo(String titulo) {
    this.titulo = titulo;
  }

  String get getAutor => autor;
  set setAutor(String autor) {
    this.autor = autor;
  }

  int get getAnoPublicacion => anoPublicacion;
  set setAnoPublicacion(int anoPublicacion) {
    this.anoPublicacion = anoPublicacion;
  }

  String get getPrestado => prestado.toString();
  set setPrestado(bool prestado) {
    this.prestado = prestado;
  }

  String get getDniCliente => dniCliente ?? '';
  set setDniCliente(String? dniCliente) {
    this.dniCliente = dniCliente;
  }

  @override
  String toString() {
    return '\n-ID: $id, \n-Titulo: $titulo, \n-Autor: $autor, \n-Año de publicación: $anoPublicacion, \n-Prestado: ${prestadoResult()}, \n-DNI del cliente: $dniCliente';
  }

  void prestar(String dni) {
    prestado = true;
    dniCliente = dni;
  }

  void devolver() {
    prestado = false;
    dniCliente = null;
  }

  bool estaPrestado() {
    return prestado;
  }

  int compareTo(Object other) {
    if (other is Tipos) {
      return id.compareTo(other.id);
    } else {
      throw ArgumentError('No se puede comparar con un objeto que no es Tipos');
    }
  }

  // Método auxiliar para mostrar "Sí" o "No" en lugar de true/false
  String prestadoResult() {
    return prestado ? 'Sí' : 'No';
  }
}

/**
 * Classe Llibre (subclasse de Tipus)
 * A més dels atributs comuns de Tipus, afegeix:
 * numPagines
 * genere
 */

class Libro extends Tipos {
  int numPaginas;
  String genero;

  Libro() : numPaginas = 0, genero = '', super();

  Libro.soloIdTitulo(String id, String titulo)
    : numPaginas = 0,
      genero = '',
      super.soloIdTitulo(id, titulo);

  Libro.conDatosCompletos(
    String id,
    String titulo,
    String autor,
    int anoPublicacion,
    bool prestado,
    String? dniCliente,
    this.numPaginas,
    this.genero,
  ) : super.conDatosCompletos(
        id,
        titulo,
        autor,
        anoPublicacion,
        prestado,
        dniCliente,
      );

  int get getNumPaginas => numPaginas;
  set setNumPaginas(int numPaginas) {
    this.numPaginas = numPaginas;
  }

  String get getGenero => genero;
  set setGenero(String genero) {
    this.genero = genero;
  }

  @override
  String toString() {
    return '${super.toString()}, \n-numPaginas: $numPaginas, \n-genero: $genero';
  }

  int compareTo(Object other) {
    if (other is Libro) {
      return id.compareTo(other.id);
    } else {
      throw ArgumentError('No se puede comparar con un objeto que no es Libro');
    }
  }
}

/**
 * Classe Revista (subclasse de Tipus)
 * A més dels atributs comuns de Tipus, afegeix:
 * numero (número de la revista)
 * periodicitat (setmanal, mensual, etc.)
 */
class Revista extends Tipos {
  int numero;
  String periodicidad;

  Revista() : numero = 0, periodicidad = '', super();

  Revista.soloIdTitulo(String id, String titulo)
    : numero = 0,
      periodicidad = '',
      super.soloIdTitulo(id, titulo);

  Revista.conDatosCompletos(
    String id,
    String titulo,
    String autor,
    int anoPublicacion,
    bool prestado,
    String? dniCliente,
    this.numero,
    this.periodicidad,
  ) : super.conDatosCompletos(
        id,
        titulo,
        autor,
        anoPublicacion,
        prestado,
        dniCliente,
      );

  int get getNumero => numero;
  set setNumero(int numero) {
    this.numero = numero;
  }

  String get getPeriodicidad => periodicidad;
  set setPeriodicidad(String periodicidad) {
    this.periodicidad = periodicidad;
  }

  @override
  String toString() {
    return '${super.toString()}, \n-Número: $numero, \n-Periodicidad: $periodicidad';
  }

  int compareTo(Object other) {
    if (other is Revista) {
      return id.compareTo(other.id);
    } else {
      throw ArgumentError(
        'No se puede comparar con un objeto que no es Revista',
      );
    }
  }
}
