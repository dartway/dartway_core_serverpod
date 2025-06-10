import 'package:dartway_core_serverpod_server/src/business/dw_session_extension.dart';
import 'package:serverpod/serverpod.dart';

class DwRealTimeEndpoint extends Endpoint {
  static userUpdatesChannel(int userId) => 'userUpdates$userId';

  @override
  Future<void> streamOpened(StreamingSession session) async {
    final userId = await session.currentUserId;

    if (userId == null) {
      return;
    }

    final channel = userUpdatesChannel(userId);

    setUserObject(
      session,
      channel,
    );

    session.log('Subscribing to channel $channel');

    session.messages.addListener(
      channel,
      (update) => _listener(session, update),
    );
  }

  _listener(StreamingSession session, SerializableModel update) {
    // We expect that everything is already wrapped the right way
    sendStreamMessage(session, update);
  }

  @override
  Future<void> streamClosed(StreamingSession session) async {
    session.messages.removeListener(
      getUserObject(session),
      (update) => _listener(session, update),
    );
  }
}
