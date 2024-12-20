import '../model/tinggi_hewan.dart';

abstract class TinggiHewanRepository {
  Future<List<TinggiHewan>> getTinggiHewan();
}
