import 'package:equatable/equatable.dart';

class HomeParams extends Equatable {
  final String name;
  final String userId;

  const HomeParams({
    required this.name,
    required this.userId,
  });

  @override
  List<Object> get props => [name, userId];
}
