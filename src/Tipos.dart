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
      throw Exception('No se puede comparar con un objeto que no es Tipos');
    }
  }

  // Método auxiliar para mostrar "Sí" o "No" en lugar de true/false
  String prestadoResult() {
    return prestado ? 'Sí' : 'No';
  }
}