enum CallType { audio, video }

enum CallAction { sent, received }

class CallLog {
  final CallType type;
  final CallAction action;
  final List<String> memberAccountIds;
  final Duration duration;
  final DateTime timestamp;
  final bool isMissed;
  CallLog({
    this.type,
    this.action,
    this.memberAccountIds,
    this.duration,
    this.timestamp,
    this.isMissed,
  });
}
