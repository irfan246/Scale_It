import '../model/jangka_hidup_hewan.dart';

abstract class JangkaHidupHewanRepository {
  Future<List<JangkaHidupHewan>> getJangkaHidupHewan();
}
