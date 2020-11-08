abstract class Api {
  //Top headlines
  static final TOP_HEADLINES = (String searchText, int limit) =>
      '/w/api.php?action=query&format=json&prop=pageimages%7Cpageterms&generator=prefixsearch&redirects=1&formatversion=2&piprop=thumbnail&pithumbsize=50&pilimit=10&wbptterms=description&gpssearch=$searchText&gpslimit=$limit';

  //Top headlines
  static final EVERYTHING = (String searchText, int limit) =>
      '/w/api.php?action=query&prop=extracts&origin=*&format=json&generator=search&gsrnamespace=0&gsrlimit=$limit&gsrsearch=$searchText';
}
