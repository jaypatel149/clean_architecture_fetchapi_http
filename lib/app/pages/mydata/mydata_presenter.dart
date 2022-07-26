import 'package:my_application/domain/domain.dart';
import 'package:my_application/domain/models/mydata_dummy.dart';

class MyDataPresenter {
  MyDataPresenter(this.authUseCases);
  final AuthUseCases authUseCases;

  Future<List<DummyModel>?> apiFetch() async => await authUseCases.apiFetch();

  Future<MyDataModel?> apiMyData(index) async =>
      await authUseCases.apiMyData(index);
}
