import 'package:firebase_chat/domain/entities/group_entity.dart';
import 'package:firebase_chat/domain/repositories/firebase_repository.dart';

class GetAllGroupsUseCase {
  final FirebaseRepository repository;

  GetAllGroupsUseCase({required this.repository});

  Stream<List<GroupEntity>> call() {
    return repository.getGroups();
  }
}
