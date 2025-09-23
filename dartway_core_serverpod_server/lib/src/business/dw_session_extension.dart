import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';
import 'package:serverpod/serverpod.dart';

import '../endpoints/dw_real_time_endpoint.dart';

extension DwSessionExtension on Session {
  // static Future<int> Function(Session session, int userInfoId)?
  //     userIdCustomGetter;

  // Future<int?> get currentUserId async => await authenticated.then(
  //       (auth) async => auth?.userId == null
  //           ? null
  //           : userIdCustomGetter == null
  //               ? auth!.userId
  //               : await userIdCustomGetter!.call(this, auth!.userId),
  //     );

  // Future<int> get requireUserId async => (await currentUserId)!;

  Future<int?> get currentUserProfileId async =>
      await DwCore.instance.currentUserProfile(this).then((value) => value?.id);

  Future<bool> isUser(int userProfileId) async =>
      userProfileId == await currentUserProfileId;

  sendUpdatesToUser(
    int userProfileId, {
    List<TableRow?>? updatedModels,
    List<TableRow?>? deletedModels,
  }) {
    messages.postMessage(
      DwRealTimeEndpoint.userUpdatesChannel(userProfileId),
      DwUpdatesTransport(
        wrappedModelUpdates: [
          if (updatedModels != null) ...DwModelWrapper.wrapMany(updatedModels),
          if (deletedModels != null)
            ...deletedModels.where((e) => e != null).map(
                  (e) => DwModelWrapper.deleted(object: e!),
                )
        ],
      ),
    );
  }

  // nitSendToChat(int chatId, SerializableModel update) {
  //   messages.postMessage(
  //     NitChatEndpoint.chatUpdatesChannel(chatId),
  //     update,
  //   );
  // }
}
