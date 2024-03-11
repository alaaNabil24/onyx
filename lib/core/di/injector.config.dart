// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:onyx/core/di/AppModule.dart' as _i15;
import 'package:onyx/core/helpers/navigation.dart' as _i4;
import 'package:onyx/features/auth/data/data%20%20source/remote/auth_api_service.dart'
    as _i9;
import 'package:onyx/features/auth/data/repositories_impl/auth_repo_impl.dart'
    as _i11;
import 'package:onyx/features/auth/domain/repositories/auth_repository.dart'
    as _i10;
import 'package:onyx/features/auth/domain/usecase/login_user_case.dart' as _i12;
import 'package:onyx/features/auth/presentation/cubit/auth/auth_cubit.dart'
    as _i14;
import 'package:onyx/features/orders/data/data%20%20source/remote/orders_api_service.dart'
    as _i5;
import 'package:onyx/features/orders/data/repositories_impl/orders_repo_impl.dart'
    as _i7;
import 'package:onyx/features/orders/domain/repositories/orders_repository.dart'
    as _i6;
import 'package:onyx/features/orders/domain/usecase/orders_use_case.dart'
    as _i8;
import 'package:onyx/features/orders/presentation/cubit/orders_cubit.dart'
    as _i13;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    await gh.factoryAsync<_i3.Dio>(
      () => appModule.dio(),
      preResolve: true,
    );
    gh.factory<_i4.NavigationApp>(() => _i4.NavigationApp());
    gh.factory<_i5.OrdersApiService>(
        () => appModule.getOrdersService(gh<_i3.Dio>()));
    gh.factory<_i6.OrdersRepository>(
        () => _i7.OrdersRepositoryImpl(gh<_i5.OrdersApiService>()));
    gh.factory<_i8.OrdersUseCase>(
        () => _i8.OrdersUseCase(gh<_i6.OrdersRepository>()));
    gh.factory<_i9.AuthApiService>(
        () => appModule.getAuthService(gh<_i3.Dio>()));
    gh.factory<_i10.AuthRepository>(
        () => _i11.AuthRepoImpl(gh<_i9.AuthApiService>()));
    gh.factory<_i12.LoginUseCase>(
        () => _i12.LoginUseCase(gh<_i10.AuthRepository>()));
    gh.factory<_i13.OrdersCubit>(
        () => _i13.OrdersCubit(gh<_i8.OrdersUseCase>()));
    gh.factory<_i14.AuthCubit>(() => _i14.AuthCubit(gh<_i12.LoginUseCase>()));
    return this;
  }
}

class _$AppModule extends _i15.AppModule {}
