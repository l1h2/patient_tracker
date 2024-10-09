import 'package:equatable/equatable.dart';

class PatientParams extends Equatable {
  final String name;
  final String userId;
  final String companyId;

  const PatientParams({
    required this.name,
    required this.userId,
    required this.companyId,
  });

  @override
  List<Object> get props => [name, userId, companyId];
}
