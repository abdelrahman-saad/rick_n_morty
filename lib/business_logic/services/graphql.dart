import 'package:graphql/client.dart';

class GraphQLService {
  final GraphQLClient _client = GraphQLClient(
      link: HttpLink('https://rickandmortyapi.com/graphql'),
      cache: GraphQLCache());




  Future getCharacters() async {
    String getAllCharactersQuery = r'''
  query GetCharacters {
    characters{
    results{
      id
      name
      status
      species
      type
      gender
      origin{
        name
      }
      location{
        name
      }
      image
      
    }
  }
  }
''';
    final QueryOptions options = QueryOptions(
      document: gql(getAllCharactersQuery),
    );
    final QueryResult result = await _client.query(options);
    //print(result.data);
    //  print(result.data!['results']);
    if(result.data ==null){
      print("null data received");
      return null;
    }else{
      // print(result.data);
      final json = result.data!['characters']['results'];
      // return Character.fromJSON(json);
      return json;
    }
  }
}
