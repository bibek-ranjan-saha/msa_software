import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msa_software/resources/api_repository.dart';
import 'package:msa_software/utils/app_utils.dart';

import '../../models/users_model.dart';
part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent,UsersState> {
  UsersBloc() : super(UsersInitial()){
    final ApiRepository apiRepository = ApiRepository();

    on < GetUsersList > ((event,emit) async {
      try{
        emit(UsersLoading());
        final usersList = await apiRepository.fetchUserList();
        emit(UsersLoaded(usersList));
        if(usersList.isEmpty)
          {
            emit(UsersError(usersList.errorMessage ?? "no data available"));
          }
      }
      on NetworkError {
        emit(const UsersError("no internet"));
      }
    });

    on < UpdateUsersList > ((event,emit) async {
      try{
        emit(UsersLoading());
        final usersList = await apiRepository.fetchUserList();
        emit(UsersLoaded(usersList));
        if(usersList.isEmpty)
        {
          emit(UsersError(usersList.errorMessage ?? "no data available"));
        }
      }
      on NetworkError {
        emit(const UsersError("no internet"));
      }
    });
  }
}