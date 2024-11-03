import 'package:machine_test/src/domain/core/models/response_models/patient_list_model/patient_list_model.dart';

abstract class IHomeRepository {
  Future<PatientListModel> getPatientList();
}
