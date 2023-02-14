import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import './injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
void configureInjection(String env) {
  getIt.init(environment: env);
}


// For injectable version 1:

// import 'package:get_it/get_it.dart';
// import 'package:injectable/injectable.dart';

// GetIt getIt = GetIt.instance;

// @InjectableInit(preferRelativeImports: false)
// void setup() => $initGetIt(getIt);


// For injectable version 2:

// import 'package:get_it/get_it.dart';
// import 'package:injectable/injectable.dart';

// GetIt getIt = GetIt.instance;

// @InjectableInit(preferRelativeImports: false)
// void setup() => getIt.init();


// If you are using injectable 2.1.0 or above use below:

// @InjectableInit(asExtension: false)
// FutureOr<GetIt> _init(GetIt getIt) => init(getIt);