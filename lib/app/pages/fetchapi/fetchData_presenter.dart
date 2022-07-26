import 'package:my_application/domain/domain.dart';

class FetchApiPresenter {
  FetchApiPresenter(this.authUseCases);
  final AuthUseCases authUseCases;

  Future<List<DummyModel>?> apiFetch() async => await authUseCases.apiFetch();
}
