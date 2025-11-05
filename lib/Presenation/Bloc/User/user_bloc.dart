import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../Domain/Entities/user.dart';
import '../../../Domain/Usecases/get_user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUser getUser;

  UserBloc(this.getUser) : super(UserInitial()) {
    on<FetchUser>(_onFetchUser);
  }

  Future<void> _onFetchUser(FetchUser event, Emitter<UserState> emit) async {
    emit(UserLoading());
    final result = await getUser(event.username);
    emit(
      result.fold(
            (failure) => UserError(failure.message),
            (user) => UserLoaded(user),
      ),
    );
  }
}