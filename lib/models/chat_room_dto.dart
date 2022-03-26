import 'package:flutter_chat_app/models/message_dto.dart';
import 'package:flutter_chat_app/models/my_user.dart';
import 'package:flutter_chat_app/widgets/chat_room/message_card.dart';

class ChatRoomDTO {
  late String id;
  late List<MyUser> users;
  late List<MessageDTO> messages;
  late DateTime lastActive;

  ChatRoomDTO.create({
    this.users = const [],
    this.messages = const [],
  }) {
    lastActive = DateTime.now();
  }

  ChatRoomDTO.fromJSON(Map<String, Object?> json) {
    id = json['id']! as String;
    var mapUsers = json['users']! as Map<String, dynamic>;
    users = [];

    mapUsers.forEach(((uid, value) {
      MyUser user = MyUser(
          avatar: value['avatar'] ?? "",
          email: value['email'] ?? "",
          name: value['name'] ?? "",
          uid: value['uid'] ?? "");
      users.add(user);
    }));
    messages = json['messages']! as List<MessageDTO>;
    lastActive = DateTime.parse(json['id']! as String);
  }

  Map<String, Object> toJSON() {
    return {
      "id": id,
      "users": users,
      "messages": messages,
      "lastActive": lastActive.toIso8601String()
    };
  }
}
