import 'package:your_alias/features/music/domain/entities/song.dart';
import 'package:your_alias/features/music/domain/repositories/song_repository.dart';

class GetAllSongs {
  final SongRepository repository;

  GetAllSongs({required this.repository});

  Future<List<Song>> call() async {
    return await repository.getAllSongs();
  }
}