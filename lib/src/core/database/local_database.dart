import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class LocalDatabase {
  late final Isar _isar; 
  bool _isInitialized = false; 

  Isar get db => _isInitialized ? _isar : throw IsarError("Isar has not been initialized");

  Future<void> initialize() async {
    if (_isInitialized) {
      throw "Isar is already initialized";
    }

    final directory = await getApplicationDocumentsDirectory();
    //_isar = await Isar.open([MovieDetailCollectionSchema], directory: directory.path);

    _isInitialized = true;
  }
}