import 'package:scale_it/domain/model/waktu_sejarah.dart';

abstract class WaktuSejarahRepository {
  Future<List<WaktuSejarah>> getWaktuSejarah();
}
