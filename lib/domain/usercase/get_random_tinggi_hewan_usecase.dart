import '../model/tinggi_hewan.dart';
import '../repository/tinggi_hewan_repository.dart';

class GetRandomTinggiHewansUseCase {
  final TinggiHewanRepository repository;

  GetRandomTinggiHewansUseCase(this.repository);

  Future<TinggiHewan> call() async {
    final tinggiHewan = await repository.getTinggiHewan();
    tinggiHewan.shuffle(); // Randomize animals list
    return tinggiHewan.first;
  }
}
