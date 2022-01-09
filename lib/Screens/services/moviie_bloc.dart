import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:magic_world/Screens/json.files/json_data.dart';
import 'package:magic_world/Screens/services/movie_service.dart';

import 'package:rxdart/rxdart.dart';

class MovieBloc extends BlocBase {
  final MovieService _productService;

  MovieBloc(this._productService) {
/*set list firebase in cache using pather bloc*/
    _loadMovies();
  }

// First

  final BehaviorSubject<List<MovieEntity>> _listMoviesController =
      BehaviorSubject<List<MovieEntity>>.seeded(<MovieEntity>[]);

  Stream<List<MovieEntity>> get listMoviesFlux => _listMoviesController.stream;

  Sink<List<MovieEntity>> get listMoviesEvent => _listMoviesController.sink;

// Second

  final BehaviorSubject<List<MovieEntity>> _listMoviesPopularController =
      BehaviorSubject<List<MovieEntity>>.seeded(<MovieEntity>[]);

  Stream<List<MovieEntity>> get listMoviesPopularFlux =>
      _listMoviesPopularController.stream;

  Sink<List<MovieEntity>> get listMoviesPopularEvent =>
      _listMoviesPopularController.sink;

// third

  final BehaviorSubject<List<MovieEntity>> _listMoviesMyListController =
      BehaviorSubject<List<MovieEntity>>.seeded(<MovieEntity>[]);

  Stream<List<MovieEntity>> get listMoviesMyListFlux =>
      _listMoviesMyListController.stream;

  Sink<List<MovieEntity>> get listMoviesMyListEvent =>
      _listMoviesMyListController.sink;

// fouth

  final BehaviorSubject<List<MovieEntity>> _listMoviesTrendingController =
      BehaviorSubject<List<MovieEntity>>.seeded(<MovieEntity>[]);

  Stream<List<MovieEntity>> get listMoviesTrendingFlux =>
      _listMoviesTrendingController.stream;

  Sink<List<MovieEntity>> get listMoviesTrendingEvent =>
      _listMoviesTrendingController.sink;

// Fifth

  final BehaviorSubject<List<MovieEntity>> _listMoviesCardController =
      BehaviorSubject<List<MovieEntity>>.seeded(<MovieEntity>[]);

  Stream<List<MovieEntity>> get listMoviesCardFlux =>
      _listMoviesCardController.stream;

  Sink<List<MovieEntity>> get listMoviesCardEvent =>
      _listMoviesCardController.sink;

// sixth

  final BehaviorSubject<List<MovieEntity>> _listBooksController =
      BehaviorSubject<List<MovieEntity>>.seeded(<MovieEntity>[]);

  Stream<List<MovieEntity>> get listBooksFlux => _listBooksController.stream;

  Sink<List<MovieEntity>> get listBooksEvent => _listBooksController.sink;

  /*load list home page by type */
  _loadMovies() async {
    listMoviesEvent.add(await _productService.getByTypeAll('Featured'));
    listMoviesTrendingEvent.add(await _productService.getByTypeAll('Trending'));
    listMoviesPopularEvent.add(await _productService.getByTypeAll('Popular'));
    listMoviesMyListEvent.add(await _productService.getByTypeAll('MyList'));
    listMoviesCardEvent.add(await _productService.getByTypeAll('highlights'));
    listBooksEvent.add(await _productService.getByTypeAll('Books'));
  }

  @override
  void dispose() {
    _listMoviesController.close();
    _listMoviesTrendingController.close();
    _listMoviesPopularController.close();
    _listMoviesMyListController.close();
    _listMoviesCardController.close();
    _listBooksController.close();
    super.dispose();
  }
}
