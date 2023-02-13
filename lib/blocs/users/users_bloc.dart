import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msa_software/resources/api_repository.dart';

import '../../models/users_model.dart';
part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent,UsersState> {
  UsersBloc() : super(UsersInitial()){
    final ApiRepository _apiRepository = ApiRepository();

    on < GetUsersList > ((event,emit) async {
      try{
        emit(UsersLoading());
        final usersList = await _apiRepository.fetchUserList();
        emit(UsersLoaded(usersList));
        if(usersList.isEmpty)
          {
            emit(const UsersError("No data available"));
          }
      }
      on NetworkError {

      }
    });
  }

}