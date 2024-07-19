import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

class DatabaseException extends Equatable implements Exception {
  late final String message; 
  
  // using initializer list, more concise
  DatabaseException.fromIsarError(IsarError isarError) : message = isarError.message;

  // you can have other constructor to choose depending on your needs
  //DatabaseException() {}

  @override
  List<Object?> get props => [message];
  
}