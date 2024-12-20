import '../model/jangka_hidup_hewan.dart';
import '../repository/jangka_hidup_hewan_repository.dart';

class GetRandomJangkaHidupHewanUseCase {
  final JangkaHidupHewanRepository repository;

  GetRandomJangkaHidupHewanUseCase(this.repository);

  Future<JangkaHidupHewan> call() async {
    final JangkaHidupHewan = await repository.getJangkaHidupHewan();
    JangkaHidupHewan.shuffle(); // Randomize animals list
    return JangkaHidupHewan.first;
  }
}
