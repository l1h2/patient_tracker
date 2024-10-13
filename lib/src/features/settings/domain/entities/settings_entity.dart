import 'package:equatable/equatable.dart';

class SettingsParams extends Equatable {
  final String userId;
  final bool isDarkMode;

  const SettingsParams({
    required this.userId,
    required this.isDarkMode,
  });

  @override
  List<Object?> get props => [userId, isDarkMode];
}
