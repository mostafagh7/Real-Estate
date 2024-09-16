import 'dart:convert';
import 'package:bloc/bloc.dart';
import '../../../core/boilerplate/pagination/bloc/pagination_bloc.dart';
import '../../../core/boilerplate/pagination/bloc/pagination_event.dart';
import '../../../main.dart';
import '../data/models/category.dart';
import '../data/models/city.dart';
import 'realestate_event.dart';
import 'realestate_state.dart';

class RealestateBloc extends Bloc<RealestateEvent, RealestateState> {
  PaginationBloc? realestateBloc;
  String offerType = "SELL";
  String? cityId;
  String? subCategoryId;
  CityModel? selectedCity;
  CategoryModel? selectedCategory;
  List<CityModel>? city;
  List<CategoryModel>? category;
  List<String>? cityList;
  List<String>? categoryList;
  RealestateBloc() : super(RealestateInitial()) {
    on<SetInitialCityEvent>((event, emit) async {
      city = event.cities;
      cityList = event.cities.map((city) => jsonEncode(city.toJson())).toList();
      await prefs!.setStringList('city_list', cityList!);
      emit(SetInitialCityState());
    });

    on<GetStoredCityEvent>((event, emit) async {
      cityList = prefs!.getStringList('city_list');
      if (cityList != null) {
        city = cityList!
            .map((city) => CityModel.fromJson(jsonDecode(city)))
            .toList();
        emit(CityListLoaded(city!));
      }
    });

    on<ChangeFilterCityTypeEvent>((event, emit) {
      cityId = event.newCityId;
      emit(FilterChangeCityState());
      _fetchData();
    });

    on<ChangeSelectedCityEvent>((event, emit) {
      selectedCity = event.city;
      emit(FilterChangeSelectedCityState());
    });

    on<SetInitialCategoryEvent>((event, emit) async {
      category = event.categories;
      categoryList = event.categories
          .map((category) => jsonEncode(category.toJson()))
          .toList();
      await prefs!.setStringList('category_list', categoryList!);
      emit(SetInitialCategoryState());
    });

    on<GetStoredCategoryEvent>((event, emit) async {
      categoryList = prefs!.getStringList('category_list');
      if (categoryList != null) {
        category = categoryList!
            .map((category) => CategoryModel.fromJson(jsonDecode(category)))
            .toList();
        emit(CategoryListLoaded(category!));
      }
    });

    on<ChangeFilterCategoryTypeEvent>((event, emit) {
      subCategoryId = event.newCategoryId;
      emit(FilterChangeCategoryState());
      _fetchData();
    });

    on<ChangeSelectedCategoryEvent>((event, emit) {
      selectedCategory = event.category;
      emit(FilterChangeSelectedCategoryState());
    });

    on<ChangeFilterOfferTypeEvent>((event, emit) {
      if (offerType != event.newOfferType) {
        offerType = event.newOfferType;
        emit(ChangeFilterOfferTypeState());
        _fetchData();
      }
    });
  }

  void _fetchData() {
    realestateBloc?.add(BasePaginationEvent());
  }
}
