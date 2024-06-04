import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/* 

----------STATES---------- 

*/
abstract class InternetConnectivityState extends Equatable {
  // Equatable is used to override == operator in dart and compare objects
  const InternetConnectivityState();

  @override
  List<Object?> get props => [];
}

class InitialState extends InternetConnectivityState {}

class InternetLostState extends InternetConnectivityState {}

class InternetGainedState extends InternetConnectivityState {}

/* 

----------EVENTS----------

*/
abstract class InternetConnectivityEvent extends Equatable {
// Equatable is used to override == operator in dart and compare objects
  const InternetConnectivityEvent();

  @override
  List<Object?> get props => [];
}

class InternetLostEvent extends InternetConnectivityEvent {}

class InternetGainedEvent extends InternetConnectivityEvent {}

/* 

----------BLOC----------

*/
class InternetConnectivityBloc
    extends Bloc<InternetConnectivityEvent, InternetConnectivityState> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _connectivitySubscription;

  InternetConnectivityBloc() : super(InitialState()) {
    on<InternetLostEvent>(
      (event, emit) => emit(InternetLostState()),
    );

    on<InternetGainedEvent>(
      (event, emit) => emit(InternetGainedState()),
    );

    // the snackbar is not shown if internet is off before starting the app, there needs to be additional ping check here like done in Moov apps

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi ||
          result == ConnectivityResult.ethernet) {
        add(InternetGainedEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();

    return super.close();
  }
}
