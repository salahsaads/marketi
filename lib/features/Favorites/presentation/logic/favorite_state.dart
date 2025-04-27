import 'package:marketi/features/Favorites/data/models/get_favorite_response_model.dart';

abstract class FavoriteState {}

final class FavoriteInitialState extends FavoriteState {}

final class GetFavoriteLoadingState extends FavoriteState {}

final class GetFavoriteSuccessState extends FavoriteState {
  final List<FavoriteDataList> favoriteDataList;

  GetFavoriteSuccessState({required this.favoriteDataList});
}

final class GetFavoriteErrorState extends FavoriteState {
  final String message;

  GetFavoriteErrorState({required this.message});
}

final class ChangeFavoriteLoadingState extends FavoriteState {}

final class ChangeFavoriteSuccessState extends FavoriteState {}

final class ChangeFavoriteErrorState extends FavoriteState {
  final String message;

  ChangeFavoriteErrorState({required this.message});
}
