abstract class Api {
  //Top headlines
  static final TOP_HEADLINES =
      (apiKey) => '/v2/top-headlines?country=us&apiKey=$apiKey';

  //Top headlines
  static final EVERYTHING =
      (apiKey) => 'https://newsapi.org/v2/everything?q=bitcoin&apiKey=$apiKey';
}
