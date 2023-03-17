import 'package:firebase_chat/domain/entities/group_entity.dart';
import 'package:firebase_chat/domain/repositories/firebase_repository.dart';

class UpdateGroupUseCase {
  final FirebaseRepository repository;

  UpdateGroupUseCase({required this.repository});
  Future<void> call(GroupEntity groupEntity) {
    return repository.updateGroup(groupEntity);
  }
}
