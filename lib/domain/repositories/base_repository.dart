import 'package:ksp_pengawas_monthly/data/remote/dio_client.dart';

abstract class BaseRepository {
  DioClient? dioClient;

  BaseRepository(this.dioClient);
}
