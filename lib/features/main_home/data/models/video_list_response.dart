class VideoListResponse {
  VideoListResponse({
    this.items,
    this.nextPageToken,
    this.pageInfo,
  });

  VideoListResponse.fromJson(dynamic json) {
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(VideoListItem.fromJson(v));
      });
    }
    nextPageToken = json['nextPageToken'];
    pageInfo =
        json['pageInfo'] != null ? PageInfo.fromJson(json['pageInfo']) : null;
  }
  List<VideoListItem>? items;
  String? nextPageToken;
  PageInfo? pageInfo;
  VideoListResponse copyWith({
    List<VideoListItem>? items,
    String? nextPageToken,
    PageInfo? pageInfo,
  }) =>
      VideoListResponse(
        items: items ?? this.items,
        nextPageToken: nextPageToken ?? this.nextPageToken,
        pageInfo: pageInfo ?? this.pageInfo,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    map['nextPageToken'] = nextPageToken;
    if (pageInfo != null) {
      map['pageInfo'] = pageInfo?.toJson();
    }
    return map;
  }
}

class PageInfo {
  PageInfo({
    this.totalResults,
    this.resultsPerPage,
  });

  PageInfo.fromJson(dynamic json) {
    totalResults = json['totalResults'];
    resultsPerPage = json['resultsPerPage'];
  }
  num? totalResults;
  num? resultsPerPage;
  PageInfo copyWith({
    num? totalResults,
    num? resultsPerPage,
  }) =>
      PageInfo(
        totalResults: totalResults ?? this.totalResults,
        resultsPerPage: resultsPerPage ?? this.resultsPerPage,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['totalResults'] = totalResults;
    map['resultsPerPage'] = resultsPerPage;
    return map;
  }
}

class VideoListItem {
  VideoListItem({
    this.id,
    this.snippet,
  });

  VideoListItem.fromJson(dynamic json) {
    final idJson = json['id'];
    if (idJson is Map) {
      final kind = idJson['kind'];
      if (kind == 'youtube#video') {
        id = idJson['videoId'];
      } else if (kind == 'youtube#playlist') {
        id = idJson['playlistId'];
      }
    } else if (idJson is String) {
      id = idJson;
    }
    snippet =
        json['snippet'] != null ? Snippet.fromJson(json['snippet']) : null;
  }

  String? id;
  Snippet? snippet;

  VideoListItem copyWith({
    String? id,
    Snippet? snippet,
  }) =>
      VideoListItem(
        id: id ?? this.id,
        snippet: snippet ?? this.snippet,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (id != null) {
      if (id!.startsWith('PL') || id!.startsWith('UU')) {
        map['id'] = {
          'kind': 'youtube#playlist',
          'playlistId': id,
        };
      } else if (id!.startsWith('UC')) {
        map['id'] = {
          'kind': 'youtube#video',
          'videoId': id,
        };
      } else {
        map['id'] = id;
      }
    }
    if (snippet != null) {
      map['snippet'] = snippet?.toJson();
    }
    return map;
  }
}

class Snippet {
  Snippet({
    this.title,
    this.description,
    this.thumbnails,
  });

  Snippet.fromJson(dynamic json) {
    title = json['title'];
    description = json['description'];
    thumbnails = json['thumbnails'] != null
        ? Thumbnails.fromJson(json['thumbnails'])
        : null;
  }
  String? title;
  String? description;
  Thumbnails? thumbnails;
  Snippet copyWith({
    String? title,
    String? description,
    Thumbnails? thumbnails,
  }) =>
      Snippet(
        title: title ?? this.title,
        description: description ?? this.description,
        thumbnails: thumbnails ?? this.thumbnails,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['description'] = description;
    if (thumbnails != null) {
      map['thumbnails'] = thumbnails?.toJson();
    }
    return map;
  }
}

class Thumbnails {
  Thumbnails({
    this.medium,
  });

  Thumbnails.fromJson(dynamic json) {
    medium = json['medium'] != null ? Medium.fromJson(json['medium']) : null;
  }
  Medium? medium;
  Thumbnails copyWith({
    Medium? medium,
  }) =>
      Thumbnails(
        medium: medium ?? this.medium,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (medium != null) {
      map['medium'] = medium?.toJson();
    }
    return map;
  }
}

class Medium {
  Medium({
    this.url,
    this.width,
    this.height,
  });

  Medium.fromJson(dynamic json) {
    url = json['url'];
    width = json['width'];
    height = json['height'];
  }
  String? url;
  num? width;
  num? height;
  Medium copyWith({
    String? url,
    num? width,
    num? height,
  }) =>
      Medium(
        url: url ?? this.url,
        width: width ?? this.width,
        height: height ?? this.height,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['width'] = width;
    map['height'] = height;
    return map;
  }
}
