import 'package:your_alias/features/music/domain/entities/song.dart';

abstract class SongRepository {
  Future<List<Song>> getAllSongs();
}