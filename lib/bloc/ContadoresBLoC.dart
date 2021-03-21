import 'dart:async';
import 'package:rxdart/rxdart.dart';

class ContadoresBLoC {

  int entero = 0;
  int enteroImpar = 1;
  int enteroPar = 2;

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


  final StreamController<String> _stringController = StreamController();
  final BehaviorSubject<String> _stringSubjet = BehaviorSubject<String>();
  Sink<String> get embudoString => _stringController.sink;
  Stream<String> get stringStream => _stringSubjet.stream;


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



  void agregarEntero() {
    this.entero++;
    embudoEnteros.add(this.entero);
  }

  void restarEntero() {
    this.entero--;
    embudoEnteros.add(this.entero);
  }


  void agregarEnteroImpar() {
    this.enteroImpar+=2;
    embudoEnterosImpar.add(this.enteroImpar);
  }

  void restarEnteroImpar() {
    this.enteroImpar-=2;
    embudoEnterosImpar.add(this.enteroImpar);
  }


  void agregarEnteroPar() {
    this.enteroPar+=2;
    embudoEnterosPar.add(this.enteroPar);
  }

  void restarEnteroPar() {
    this.enteroPar-=2;
    embudoEnterosPar.add(this.enteroPar);
  }

  void reset() {
    this.entero=0;
    this.enteroImpar=1;
    this.enteroPar=2;
    embudoEnteros.add(this.entero);
    embudoEnterosImpar.add(this.enteroImpar);
    embudoEnterosPar.add(this.enteroPar);
    embudoString.add("DATA CLEARED! :)");
  }



}