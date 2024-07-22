import 'package:bloc/bloc.dart';
import 'package:sadiq/Features/Authentication/View/cubit/auth_signin_mixin.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> with SigninMixin {
  AuthCubit() : super(AuthInitial());
  
}
