import 'package:marketi/features/home/data/models/banner_response_model.dart';
import 'package:marketi/features/home/data/models/categories_response_model.dart';
import 'package:marketi/features/home/data/models/product_response_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

// Banners

class HomeBannerLoadingState extends HomeState {}

class HomeBannerSuccessState extends HomeState {
  List<DataBanner> bannerList;
  HomeBannerSuccessState({required this.bannerList});
}

class HomeBannerErrorState extends HomeState {
  final String message;

  HomeBannerErrorState({required this.message});
}

// Categories

class HomeCategoriesLoadingState extends HomeState {}

class HomeCategoriesSuccessState extends HomeState {
  List<CategoriesDataList> categoriesDataList;
  HomeCategoriesSuccessState({required this.categoriesDataList});
}

class HomeCategoriesErrorState extends HomeState {
  final String message;
  HomeCategoriesErrorState({required this.message});
}

// All Products

class HomeAllProductsLoadingState extends HomeState {}

class HomeAllProductsSuccessState extends HomeState {
  List<ProductDetailsModel> allProductsList;
  HomeAllProductsSuccessState({required this.allProductsList});
}

class HomeAllProductsErrorState extends HomeState {
  final String message;
  HomeAllProductsErrorState({required this.message});
}

// Category By Id

class HomeCategoryByIdLoadingState extends HomeState {}

class HomeCategoryByIdSuccessState extends HomeState {
  List<ProductDetailsModel> categoryList;
  HomeCategoryByIdSuccessState({required this.categoryList});
}

class HomeCategoryByIdErrorState extends HomeState {
  final String message;
  HomeCategoryByIdErrorState({required this.message});
}
