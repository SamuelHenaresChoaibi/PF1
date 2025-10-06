import 'Cliente.dart';
import 'Libro.dart';
import 'Revista.dart';

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
void main() {
  List<Libro> listaLibros = new List<Libro>.filled(5, Libro());
  List<Revista> listaRevistas = new List<Revista>.filled(5, Revista());

  //Libros
  listaLibros[0] = Libro.soloIdTitulo("L1", "Las 48 Leyes del Poder");
  listaLibros[0].setAutor = "Robert Greene";
  listaLibros[0].setAnoPublicacion = 1998;
  listaLibros[0].setNumPaginas = 452;
  listaLibros[0].setGenero = "Autoayuda/Estrategia";

  listaLibros[1] = Libro.conDatosCompletos(
    "L2",
    "El Manifiesto Comunista",
    "Karl Marx y Friedrich Engels",
    1848,
    false,
    null,
    48,
    "Filosofía Política",
  );

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

  listaLibros[4] = Libro.conDatosCompletos(
    'L5',
    'Así Habló Zaratustra',
    'Friedrich Nietzsche',
    1883,
    false,
    null,
    327,
    'Filosofía',
  );

  //Revistas
  listaRevistas[0] = Revista.soloIdTitulo("R1", "Adbusters");
  listaRevistas[0].setAutor = "Varios";
  listaRevistas[0].setAnoPublicacion = 1989;
  listaRevistas[0].setNumero = 1;
  listaRevistas[0].setPeriodicidad = "Bimestral";

  listaRevistas[1] = Revista.conDatosCompletos(
    "R2",
    "Jacobin",
    "Varios",
    2010,
    false,
    null,
    1,
    "Trimestral",
  );

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

  listaRevistas[4] = Revista.conDatosCompletos(
    "R5",
    "National Review",
    "Varios",
    1955,
    false,
    null,
    1,
    "Quincenal",
  );

  //Clientes
  Cliente cliente1 = Cliente.conDatosCompletos(
    "78222723E",
    "Samuel Henares",
    "shc@gmail.com",
    "666777888",
    "CB12345",
  );
  Cliente cliente2 = Cliente.conDatosCompletos(
    "12345678A",
    "Adrian Plaza",
    "apr@gmail.com",
    "123456789",
    "CB54321",
  );
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
    if (libro.estaPrestado()) {
      contadorPrestamosLibros++;
    }
  }

  for (var revista in listaRevistas) {
    if (revista.estaPrestado()) {
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
    if (libro.getAnoPublicacion < libroMasAntiguo.getAnoPublicacion) {
      libroMasAntiguo = libro;
    }
  }

  //Revista más reciente
  Revista revistaMasReciente = listaRevistas[0];
  for (var revista in listaRevistas) {
    if (revista.getAnoPublicacion > revistaMasReciente.getAnoPublicacion) {
      revistaMasReciente = revista;
    }
  }

  print('\nEl libro más antiguo es: ${libroMasAntiguo.toString()}');
  print('\nLa revista más reciente es: ${revistaMasReciente.toString()}');
}