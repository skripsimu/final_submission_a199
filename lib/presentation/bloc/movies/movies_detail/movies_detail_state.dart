part of 'movies_detail_bloc.dart';

abstract class MoviesDetailState extends Equatable {
  const MoviesDetailState();
  
  @override
  List<Object> get props => [];
}

class MoviesDetailInitial extends MoviesDetailState {}

class MoviesDetailLoading extends MoviesDetailState {}

class MoviesDetailError extends MoviesDetailState {
  final String message;

  const MoviesDetailError(this.message);

  @override
  List<Object> get props => [message];
}

class MoviesDetailSuccess extends MoviesDetailState {
  final MovieDetail result;
  final List<Movie> recommendations;

  const MoviesDetailSuccess(this.result, {this.recommendations = const []}
  );

  @override
  List<Object> get props => [result, recommendations];
}
