import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/networking/api_result.dart';
import 'package:marketi/features/home/data/models/banner_response_model.dart';
import 'package:marketi/features/home/data/models/categories_response_model.dart';
import 'package:marketi/features/home/data/models/product_response_model.dart';
import 'package:marketi/features/home/data/repository/home_repository.dart';
import 'package:marketi/features/home/presentation/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;

  HomeCubit(this._homeRepository) : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<DataBanner>? bannerList = [];
  List<CategoriesDataList>? categoriesList = [];
  List<ProductDetailsModel>? allProductsList = [];
  List<ProductDetailsModel>? searchList = [];

  void emitStatesBanners() async {
    emit(HomeBannerLoadingState());
    final response = await _homeRepository.getBanners();

    if (response is Success<BannerResponseModel>) {
      bannerList = response.data.data!;
      emit(HomeBannerSuccessState(bannerList: bannerList!));
    } else if (response is Failure<BannerResponseModel>) {
      emit(HomeBannerErrorState(message: response.apiErrorModel));
    }
  }

  void emitStatesCategories() async {
    emit(HomeCategoriesLoadingState());
    final response = await _homeRepository.getCategories();

    if (response is Success<CategoriesResponseModel>) {
      categoriesList = response.data.data!.data!;
      emit(HomeCategoriesSuccessState(categoriesDataList: categoriesList!));
    } else if (response is Failure<CategoriesResponseModel>) {
      emit(HomeCategoriesErrorState(message: response.apiErrorModel));
    }
  }

  void emitStatesAllProducts() async {
    emit(HomeAllProductsLoadingState());
    final response = await _homeRepository.getAllProducts();

    if (response is Success<ProductResponseModel>) {
      allProductsList = response.data.data!.data!;
      emit(HomeAllProductsSuccessState(allProductsList: allProductsList!));
    } else if (response is Failure<ProductResponseModel>) {
      emit(HomeAllProductsErrorState(message: response.apiErrorModel));
    }
  }

  // void emitSearchStates(String text) async {
  //   emit(const HomeState.searchForProductLoading());
  //   final response = await _homeRepository.searchForProduct(text);

  //   response.when(
  //     success: (data) {
  //       searchList = data.data!.data;

  //       emit(HomeState.searchForProductSuccess(searchList));
  //     },
  //     failure: (message) {
  //       emit(HomeState.searchForProductError(message: message));
  //     },
  //   );
  // }

  List<ProductDetailsModel>? categoryProductsList = [];

  void getCategoryById(int id) async {
    emit(HomeCategoryByIdLoadingState());
    final response = await _homeRepository.getCategoryById(id);

    if (response is Success<ProductResponseModel>) {
      categoryProductsList = response.data.data!.data;
      emit(HomeCategoryByIdSuccessState(categoryList: categoryProductsList!));
    } else if (response is Failure<ProductResponseModel>) {
      emit(HomeCategoryByIdErrorState(message: response.apiErrorModel));
    }
  }
}
