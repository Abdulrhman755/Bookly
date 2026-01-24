import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'panelization_summary.g.dart';

@HiveType(typeId: 5)
class PanelizationSummary extends Equatable {
  @HiveField(0)
  final bool? containsEpubBubbles;
  @HiveField(1)
  final bool? containsImageBubbles;

  const PanelizationSummary({
    this.containsEpubBubbles,
    this.containsImageBubbles,
  });

  factory PanelizationSummary.fromJson(Map<String, dynamic> json) {
    return PanelizationSummary(
      containsEpubBubbles: json['containsEpubBubbles'] as bool?,
      containsImageBubbles: json['containsImageBubbles'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
    'containsEpubBubbles': containsEpubBubbles,
    'containsImageBubbles': containsImageBubbles,
  };

  @override
  List<Object?> get props => [containsEpubBubbles, containsImageBubbles];
}
