import 'package:scale_it/domain/model/waktu_sejarah.dart';
import 'package:scale_it/domain/repository/waktu_sejarah_repository.dart';

class GetRandomWaktuSejarahUseCase {
  final WaktuSejarahRepository repository;

  GetRandomWaktuSejarahUseCase(this.repository);

  Future<WaktuSejarah> call() async {
    final waktuSejarah = await repository.getWaktuSejarah();
    waktuSejarah.shuffle();
    return waktuSejarah.first;
  }
}
