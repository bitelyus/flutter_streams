import 'dart:async';
import 'package:rxdart/rxdart.dart';

class ContadoresBLoC {
  /// DEFINIMOS NUESTRA ZONA DE ATRIBUTOS

  /// Nuestro contador para enteros
  int entero = 0;

  /// Nuestro contador para número impares
  int enteroImpar = 1;

  /// Nuestro contador para guardar numeros enteros pares
  int enteroPar = 2;


  /// ZONA DE STREAMS

  // CONTROLADOR > TRAMPA > EMBUDO > STREAM

  final StreamController<int> _intController = StreamController<int>();
  final BehaviorSubject<int> _enterosSubject = BehaviorSubject<int>();

  Sink<int> get embudoEnteros => _intController.sink;

  Stream<int> get enterosStream => _enterosSubject.stream;

  // CONTROLADOR > TRAMPA > EMBUDO > STREAM
  final StreamController<int> _intOddController = StreamController<int>();
  final BehaviorSubject<int> _enterosOddSubject = BehaviorSubject<int>();

  Sink<int> get embudoEnterosImpar => _intOddController.sink;

  Stream<int> get enterosStreamImpar => _enterosOddSubject.stream;

  // CONTROLADOR > TRAMPA > EMBUDO > STREAM
  final StreamController<int> _intEvenController = StreamController<int>();
  final BehaviorSubject<int> _enterosEvenSubject = BehaviorSubject<int>();

  Sink<int> get embudoEnterosPar => _intEvenController.sink;

  Stream<int> get enterosStreamPar => _enterosEvenSubject.stream;

  // CONTROLADOR PARA STRINGS > TRAMPA > EMBUDO > STREAM
  final StreamController<String> _stringController = StreamController();
  final BehaviorSubject<String> _stringSubjet = BehaviorSubject<String>();

  Sink<String> get embudoString => _stringController.sink;

  Stream<String> get stringStream => _stringSubjet.stream;

  /// CONSTRUCTOR DEL BLOQUE
  /// Ponemos la "trampa" a nuestros StreamS para poder recoger lo que se vaya echando al "embudo"
  ContadoresBLoC() {
    _intController.stream.listen((event) {
      _enterosSubject.add(event);
    });

    _intOddController.stream.listen((event) {
      _enterosOddSubject.add(event);
    });

    _intEvenController.stream.listen((event) {
      _enterosEvenSubject.add(event);
    });

    _stringController.stream.listen((event) {
      _stringSubjet.add(event);
    });
  }

  /// ZONA DE MÉTODOS - LÓGIA DE NEGOCIO ...

  /// DEBEMOS CERRAR LOS STREAMS PARA LIBERAR RECURSOS
  void dispose() {
    _intController.close();
    _enterosSubject.close();
    _intOddController.close();
    _enterosOddSubject.close();
    _intEvenController.close();
    _enterosEvenSubject.close();

    _stringController.close();
    _stringSubjet.close();
  }

  /// FUNCIÓN PARA AUMENTAR EN UNO EL CONTADOR DE ENTEROS
  void agregarEntero() {
    this.entero++;
    embudoEnteros.add(this.entero);
  }

  /// FUNCIÓN PARA RESTAR UNO DEL CONTADOR DE ENTEROS
  void restarEntero() {
    this.entero--;
    embudoEnteros.add(this.entero);
  }


  void agregarEnteroImpar() {
    this.enteroImpar += 2;
    embudoEnterosImpar.add(this.enteroImpar);
  }

  void restarEnteroImpar() {
    this.enteroImpar -= 2;
    embudoEnterosImpar.add(this.enteroImpar);
  }

  void agregarEnteroPar() {
    this.enteroPar += 2;
    embudoEnterosPar.add(this.enteroPar);
  }

  void restarEnteroPar() {
    this.enteroPar -= 2;
    embudoEnterosPar.add(this.enteroPar);
  }

  /// FUNCIÓN PARA RESETAR TODOS LOS VALORES DE ATRIBUTOS O VARIALES DE LA CLASE
  void reset() {
    this.entero = 0;
    this.enteroImpar = 1;
    this.enteroPar = 2;
    embudoEnteros.add(this.entero);
    embudoEnterosImpar.add(this.enteroImpar);
    embudoEnterosPar.add(this.enteroPar);
    embudoString.add("DATA CLEARED! :)");
  }
}
