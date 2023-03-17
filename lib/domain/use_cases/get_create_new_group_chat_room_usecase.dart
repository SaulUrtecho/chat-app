import 'package:firebase_chat/domain/entities/my_chat_entity.dart';
import 'package:firebase_chat/domain/repositories/firebase_repository.dart';

class GetCreateNewGroupChatRoomUseCase {
  final FirebaseRepository repository;

  GetCreateNewGroupChatRoomUseCase({required this.repository});

  Future<void> call(MyChatEntity myChatEntity, List<String> selectUserList) {
    return repository.getCreateNewGroupChatRoom(myChatEntity, selectUserList);
  }
}
