import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/get_popular_movies.dart';
import 'package:equatable/equatable.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  PopularMoviesBloc(GetPopularMovies getPopularMovies) : super(PopularMoviesInitial()) {
    on<PopularMoviesEvent>((event, emit) async {
      emit(PopularMoviesLoading());

      final result = await getPopularMovies.execute();

      result.fold((failure) {
        final state = PopularMoviesError(failure.message);

        emit(state);
      }, (data) {
        final tvSeries = data;
        final state = PopularMoviesSuccess(tvSeries);

        emit(state);
      });
    });
  }
}
