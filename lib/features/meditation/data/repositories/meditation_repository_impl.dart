
import 'package:your_alias/features/meditation/data/datasources/meditation_remote_datasource.dart';
import 'package:your_alias/features/meditation/domain/entities/daily_quote.dart';
import 'package:your_alias/features/meditation/domain/entities/mood_message.dart';
import 'package:your_alias/features/meditation/domain/repositories/meditation_repository.dart';

class MeditationRepositoryImpl implements MeditationRepository {
  final MeditationRemoteDataSource remoteDataSource;

  MeditationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<DailyQuote> getDailyQuote() async {
    return await remoteDataSource.getDailyQuote();
  }

  @override
  Future<MoodMessage> getMoodMessage(String mood) async {
    return await remoteDataSource.getMoodMessage(mood);
  }

}