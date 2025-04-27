import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/networking/api_result.dart';
import 'package:marketi/features/Favorites/data/models/favorite_request_model.dart';
import 'package:marketi/features/Favorites/data/models/favorite_response_model.dart';
import 'package:marketi/features/Favorites/data/models/get_favorite_response_model.dart';

import 'package:marketi/features/Favorites/data/repository/favorite_repository.dart';

import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepository _favoriteRepository;
  FavoriteCubit(this._favoriteRepository) : super(FavoriteInitialState());

  static FavoriteCubit get(context) => BlocProvider.of(context);

  List<FavoriteDataList>? favoriteList = [];

  void getFavorites() async {
    emit(GetFavoriteLoadingState());

    final response = await _favoriteRepository.getFavorites();

    if (response is Success<GetFavoriteResponseModel>) {
      favoriteList = response.data.data!.data;
      emit(GetFavoriteSuccessState(favoriteDataList: favoriteList!));
    } else {
      emit(GetFavoriteErrorState(message: 'Not found products'));
    }
  }

  void addProductFavorites(int id) async {
    emit(GetFavoriteLoadingState());

    final response = await _favoriteRepository
        .addProductFavorites(FavoriteRequestModel(productId: id));

    if (response is Success<FavoriteResponseModel>) {
      getFavorites();

      emit(ChangeFavoriteSuccessState());
    } else {
      emit(GetFavoriteErrorState(message: 'Not found products'));
    }
  }
}
