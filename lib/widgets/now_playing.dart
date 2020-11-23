import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/bloc/get_now_playing_bloc.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/movie_response.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:movie_app/style/theme.dart' as Style;

class NowPlaying extends StatefulWidget {
  @override
  _NowPlayingState createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: nowPlayingMoviesBloc.subject.stream,
      builder: (BuildContext context, AsyncSnapshot<MovieResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            print('error');
            return _buildErrorWidget(snapshot.data.error);
          }
          print('data');
          return _buildNowPlayingWidget(snapshot.data);
        } else if (snapshot.hasError) {
          print('error2');
          return _buildErrorWidget(snapshot.error);
        } else {
          print('loading');
          return _buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 25,
            width: 25,
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }

  Widget _buildErrorWidget(error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('It\'s raining here..open umbrella'),
        ],
      ),
    );
  }

  Widget _buildNowPlayingWidget(MovieResponse data) {
    List<Movie> movies = data.movies;
    print(movies);
    if (movies.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('It\'s lonely here'),
          ],
        ),
      );
    } else {
      return Container(
          height: 220,
          child: PageIndicatorContainer(
              length: 2,
              align: IndicatorAlign.bottom,
              indicatorSpace: 8.0,
              padding: EdgeInsets.all(5.0),
              indicatorColor: Style.Colors.titleColor,
              indicatorSelectorColor: Style.Colors.secondaryColor,
              pageView: PageView.builder(
                itemBuilder: (context, index) {
                  return Stack(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 220,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://image.tmdb.org/t/p/${movies[index].backPoster}',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Style.Colors.primaryColor.withOpacity(1.0),
                                Style.Colors.primaryColor.withOpacity(0.0),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: [
                                0.0,
                                0.9,
                              ]),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Icon(
                          FontAwesomeIcons.playCircle,
                          color: Style.Colors.secondaryColor,
                          size: 40.0,
                        ),
                      ),
                      Positioned(
                        bottom: 30.0,
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          width: 255,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(movies[index].title,
                                  style: TextStyle(
                                    height: 1.5,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ))
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: movies.take(5).length,
              )));
    }
  }
}
