import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:Foodlify/core/sl/sl_container.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies() => init(sl);
