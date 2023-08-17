import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/data/network/api_constants.dart';
import 'package:movies_app/core/domain/entities/media.dart';
import 'package:movies_app/core/presentation/components/overview_section.dart';
import 'package:movies_app/core/presentation/components/section_title.dart';
import 'package:movies_app/core/resources/app_routes.dart';
import 'package:movies_app/core/resources/app_strings.dart';

String getDate(String? date) {
  if (date == null || date.isEmpty) {
    return '';
  }

  final vals = date.split('-');
  String year = vals[0];
  int monthNb = int.parse(vals[1]);
  String day = vals[2];

  String month = '';

  switch (monthNb) {
    case 1:
      month = 'Jan';
      break;
    case 2:
      month = 'Feb';
      break;
    case 3:
      month = 'Mar';
      break;
    case 4:
      month = 'Apr';
      break;
    case 5:
      month = 'May';
      break;
    case 6:
      month = 'Jun';
      break;
    case 7:
      month = 'Jul';
      break;
    case 8:
      month = 'Aug';
      break;
    case 9:
      month = 'Sep';
      break;
    case 10:
      month = 'Oct';
      break;
    case 11:
      month = 'Nov';
      break;
    case 12:
      month = 'Dec';
      break;
    default:
      break;
  }

  return '$month $day, $year';
}

String getPosterUrl(String? path) {
  if (path != null) {
    return ApiConstants.basePosterUrl + path;
  } else {
    return ApiConstants.moviePlaceHolder;
  }
}

String getBackdropUrl(String? path) {
  if (path != null) {
    return ApiConstants.baseBackdropUrl + path;
  } else {
    return ApiConstants.moviePlaceHolder;
  }
}


String getLength(int? runtime) {
  if (runtime == null || runtime == 0) {
    return '';
  }
  if (runtime < 60) {
    return '${runtime}m';
  }
  if (runtime % 60 == 0) {
    return '${runtime ~/ 60}h';
  }
  return '${runtime ~/ 60}h ${runtime % 60}m';
}

String getVotesCount(int voteCount) {
  if (voteCount < 1000) {
    return '($voteCount)';
  }
  return '(${voteCount ~/ 1000}k)';
}

String getProfileImageUrl(Map<String, dynamic> json) {
  if (json['profile_path'] != null) {
    return ApiConstants.baseProfileUrl + json['profile_path'];
  } else {
    return ApiConstants.castPlaceHolder;
  }
}


String getGenres(List<dynamic> genres) {
  if (genres.isNotEmpty) {
    return genres.first['name'];
  } else {
    return '';
  }
}


String getTrailerUrl(Map<String, dynamic> json) {
  List videos = json['videos']['results'];
  if (videos.isNotEmpty) {
    List trailers = videos.where((e) => e['type'] == 'Trailer').toList();
    if (trailers.isNotEmpty) {
      return ApiConstants.baseVideoUrl + trailers.last['key'];
    } else {
      return '';
    }
  } else {
    return '';
  }
}

void navigateToDetailsView(BuildContext context, Media media) {
  if (media.isMovie) {
    context.pushNamed(
      AppRoutes.movieDetailsRoute,
      params: {'movieId': media.tmdbID.toString()},
    );
  } 
}


Widget getOverviewSection(String overview) {
  if (overview.isNotEmpty) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: AppStrings.story),
        OverviewSection(overview: overview),
      ],
    );
  } else {
    return const SizedBox();
  }
}