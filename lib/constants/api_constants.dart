const kBaseUrl = 'https://pokeapi.co/api/v2/';
const kPageItemsCount = 20;
const kPokemonUrl = '${kBaseUrl}pokemon/';
const kPokemonPaginationUrl = '$kPokemonUrl?limit=$kPageItemsCount';
const kPokemonNextPageUrl = '$kPokemonPaginationUrl&offset=';
