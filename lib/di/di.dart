import 'package:technorio/repository/checkin_repository.dart';
import 'package:technorio/utils/httpservices.dart';

final _injector = _Injector();

final CheckinRepository checkinRepository = _injector.checkinRepository;

class _Injector {
  _Injector._internal();
  static final _singleton = _Injector._internal();
  factory _Injector() => _singleton;

  CheckinRepository get checkinRepository =>
      CheckinRepositoryImpl(HttpServices.getDioInstance());
}
