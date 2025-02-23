
import 'package:your_alias/features/music/data/datasources/song_remote_datasource.dart';
import 'package:your_alias/features/music/domain/entities/song.dart';
import 'package:your_alias/features/music/domain/repositories/song_repository.dart';

class SongRepositoryImpl implements SongRepository {
  final SongRemoteDataSource remoteDataSource;

  SongRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Song>> getAllSongs() async {
    final songModels = await remoteDataSource.getAllSongs();
    return songModels;
  }

}