import 'Tipos.dart';

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
    return '${super.toString()}, \n-Número de páginas: $numPaginas, \n-Género: $genero';
  }

  int compareTo(Object other) {
    if (other is Libro) {
      return id.compareTo(other.id);
    } else {
      throw Exception('No se puede comparar con un objeto que no es Libro');
    }
  }
}