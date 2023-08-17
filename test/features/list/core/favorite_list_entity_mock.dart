import 'package:movie_app/features/detail/domain/entities/content_interface.dart';
import 'package:movie_app/features/detail/domain/entities/moviel_detail_entity.dart';
import 'package:movie_app/features/detail/domain/entities/tv_show_detail_entity.dart';
import 'package:movie_app/features/list/domain/entities/favorite_list_entity.dart';
import 'package:uuid/uuid.dart';

final tFavoriteList = FavoriteListEntity(
  listContent: [
    FavoriteListItemEntity(
      listTitle: "Minha lista",
      content: {
        MovieDetailEntity(
          id: 550,
          backdropPath: "/hZkgoQYus5vegHoetLkCJzb17zJ.jpg",
          genres: [Genre(name: "Drama")],
          originalLanguage: 'en',
          originalTitle: 'Fight Club',
          overview:
              'A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground "fight clubs" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.',
          posterPath: '/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg',
          releaseDate: DateTime.parse('1999-10-15'),
          title: 'Fight Club',
        ),
        TVShowDetailEntity(
          backdropPath: '/9faGSFi5jam6pDWGNd0p8JcJgXQ.jpg',
          createdBy: [CreatedBy(name: "Vince Gilligan")],
          firstAirDate: DateTime.parse('2008-01-20'),
          genres: [Genre(name: 'Drama'), Genre(name: 'Crime')],
          id: 1396,
          name: 'Breaking Bad',
          networks: [
            Network(
              id: 174,
              logoPath: '/alqLicR1ZMHMaZGP3xRQxn9sq7p.png',
              name: 'AMC',
              originCountry: 'US',
            )
          ],
          numberOfSeasons: 5,
          originalLanguage: 'en',
          originalName: 'Breaking Bad',
          overview:
              'When Walter White, a New Mexico chemistry teacher, is diagnosed with Stage III cancer and given a prognosis of only two years left to live. He becomes filled with a sense of fearlessness and an unrelenting desire to secure his family\'s financial future at any cost as he enters the dangerous world of drugs and crime.',
          posterPath: '/ztkUQFLlC19CCMYHW9o1zWhJRNq.jpg',
          seasons: [],
        )
      },
      uuid: const Uuid().v4(),
    )
  ],
);
