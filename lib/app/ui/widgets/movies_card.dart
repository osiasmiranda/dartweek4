import 'package:dartweek4_app/app/ui/filmes_app_icons_icons.dart';
import 'package:dartweek4_app/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoviesCard extends StatelessWidget {
  final dateFormat = DateFormat('dd/MM/y');
  final MovieModel movie;
  MoviesCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 158,
      height: 280,
      // padding: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      movie.posterPath,
                      width: 148,
                      height: 184,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text(
                      dateFormat.format(DateTime.parse(movie.releaseDate)),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 75,
              right: -5,
              child: Material(
                elevation: 5,
                shape: CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  height: 30,
                  child: IconButton(
                    onPressed: () {
                      print('Clicou Favorites');
                    },
                    iconSize: 15,
                    icon: Icon(
                      FilmesAppIcons.heart_empty,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}