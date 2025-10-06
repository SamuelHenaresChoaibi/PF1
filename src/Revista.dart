import 'Tipos.dart';

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
      throw Exception('No se puede comparar con un objeto que no es Revista');
    }
  }
}
