// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'module/appupdates/controller/appupdates_controller.dart' as _i3;
import 'module/detail/controller/detail_controller.dart' as _i4;
import 'module/download/controller/download_controller.dart' as _i5;
import 'module/home/controller/home_controller.dart' as _i6;
import 'module/search_mod/controller/search_mod_controller.dart' as _i7;
import 'module/splash/controller/splash_controller.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.AppupdatesController>(_i3.AppupdatesController());
    gh.singleton<_i4.DetailController>(_i4.DetailController());
    gh.singleton<_i5.DownloadController>(_i5.DownloadController());
    gh.singleton<_i6.HomeController>(_i6.HomeController());
    gh.singleton<_i7.SearchModController>(_i7.SearchModController());
    gh.singleton<_i8.SplashController>(_i8.SplashController());
    return this;
  }
}
