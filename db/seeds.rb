require_relative '../app/models/comedian'
require_relative '../app/models/special'

comedians = [
  {name: "Louis C.K.", birthdate: "September 12, 1967", city: "Washington, D.C."},
  {name: "Chris Rock", birthdate: "February 7, 1965", city: "Andrews, South Carolina"},
  {name: "Jerry Seinfeld", birthdate: "April 29, 1954", city: "Brooklyn, New York"},
  {name: "Bill Cosby", birthdate: "July 12, 1937", city: "Philadelphia, Pennsylvania"},
  {name: "Dave Chappelle", birthdate: "August 24, 1973", city: "Washington, D.C."},
  {name: "Steve Martin", birthdate: "August 14, 1945", city: "Waco, Texas"},
  {name: "Steven Wright", birthdate: "December 6, 1955", city: "Cambridge, Massachusetts"},
  {name: "Billy Connolly", birthdate: "24 November 1942", city: "Anderston, Glasgow, Scotland"},
  {name: "Hasan Minhaj", birthdate: "September 23, 1985", city: "Davis, California"},
  {name: "Mike Birbiglia", birthdate: "June 22, 1987", city: "Shrewsbury, Massachusetts"},
  {name: "Jerrod Carmichael", birthdate: "June 22, 1987", city: "Los Angeles, California"},
  {name: "Tracy Morgan", birthdate: "November 10, 1968", city: "New York City, New York"}
]

specials = [
  {title: "Louis C.K. 2017", runtime: 74, thumbnail: "https://m.media-amazon.com/images/M/MV5BOGYwMmVlMWUtZDE2My00MzMyLTk5MTQtZDdmM2U5YWQwZjM1XkEyXkFqcGdeQXVyMjExNDAyOTU@._V1_UY268_CR4,0,182,268_AL_.jpg", comedian_id: 1},
  {title: "Louis C.K.: Shameless", runtime: 56, thumbnail: "https://m.media-amazon.com/images/M/MV5BMjE4NjE1ODI5Ml5BMl5BanBnXkFtZTcwMTgxNjc0MQ@@._V1_UY268_CR4,0,182,268_AL_.jpg", comedian_id: 1},
  {title: "Louis C.K.: Live at the Comedy Store", runtime: 66, thumbnail: "https://m.media-amazon.com/images/M/MV5BODJlMmIyNjEtZDQ0ZS00MGIyLWEyZmYtOTQyYTQyMWJkODhmXkEyXkFqcGdeQXVyMjQ0ODQ0MzQ@._V1_UX182_CR0,0,182,268_AL_.jpg", comedian_id: 1},
  {title: "Chris Rock: Kill the Messenger - London, New York, Johannesburg", runtime: 79, thumbnail: "https://m.media-amazon.com/images/M/MV5BMjAwMjQxNDA5OF5BMl5BanBnXkFtZTcwNTE3MzM5MQ@@._V1_UY268_CR11,0,182,268_AL_.jpg", comedian_id: 2},
  {title: "Chris Rock: Never Scared", runtime: 80, thumbnail: "https://m.media-amazon.com/images/M/MV5BMTlhYzMzNzItNWMyYy00ZGRlLWI1N2UtOGI2YjIwOGEwYTViXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_UX182_CR0,0,182,268_AL_.jpg", comedian_id: 2},
  {title: "Chris Rock: Bigger & Blacker", runtime: 65, thumbnail: "https://m.media-amazon.com/images/M/MV5BODQzOWExYjktZDQ2OC00YTA5LWI3YzctMDFjNjc3ZTM5NTA0XkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_UY268_CR4,0,182,268_AL_.jpg", comedian_id: 2},
  {title: "Jerry Seinfeld: 'I'm Telling You for the Last Time'", runtime: 75, thumbnail: "https://m.media-amazon.com/images/M/MV5BNDM4OTY0NTAyMF5BMl5BanBnXkFtZTcwNTcxMDQyMQ@@._V1_UY268_CR0,0,182,268_AL_.jpg", comedian_id: 3},
  {title: "Jerry Seinfeld: Stand-Up Confidential", runtime: 55, thumbnail: "https://m.media-amazon.com/images/M/MV5BYjZlNTgxMzYtZjc1ZS00OTQzLThiYWYtMTEzYjNmNDM1NmFkXkEyXkFqcGdeQXVyMzU0NzkwMDg@._V1_UX182_CR0,0,182,268_AL_.jpg", comedian_id: 3},
  {title: "Jerry Before Seinfeld", runtime: 62, thumbnail: "https://m.media-amazon.com/images/M/MV5BOTc2N2I0Y2UtOTgyYy00MTU3LTk1YzItZGIwMDcxY2JkMGQzXkEyXkFqcGdeQXVyMjQzNzk2ODk@._V1_UY268_CR1,0,182,268_AL_.jpg", comedian_id: 3},
  {title: "Bill Cosby: Far from Finished", runtime: 95, thumbnail: "https://m.media-amazon.com/images/M/MV5BOTU0OTk0MTczNF5BMl5BanBnXkFtZTgwNDAyODA2MDE@._V1_UY268_CR1,0,182,268_AL_.jpg", comedian_id: 4},
  {title: "Bill Cosby: 49", runtime: 67, thumbnail: "https://m.media-amazon.com/images/M/MV5BMTYzNzEwMDE4Ml5BMl5BanBnXkFtZTcwODk0MDAzMQ@@._V1_UX182_CR0,0,182,268_AL_.jpg", comedian_id: 4},
  {title: "Bill Cosby: Himself", runtime: 105, thumbnail: "https://m.media-amazon.com/images/M/MV5BMTUyMjg0NjgyOV5BMl5BanBnXkFtZTcwNzE2OTczMQ@@._V1_UY268_CR6,0,182,268_AL_.jpg", comedian_id: 4},
  {title: "Dave Chappelle: Equanimity", runtime: 60, thumbnail: "https://m.media-amazon.com/images/M/MV5BODJkMTAxNmYtZDg4OS00NzA2LTlmZTUtMDc2MjIwMzE4ZDMxXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_UY268_CR4,0,182,268_AL_.jpg", comedian_id: 5},
  {title: "Dave Chappelle: The Bird Revelation", runtime: 49, thumbnail: "https://m.media-amazon.com/images/M/MV5BNGYzOTE0YzEtMjc5NC00MTg2LTk2MDAtMzJlMjM1NTU1MjcwXkEyXkFqcGdeQXVyMTk2ODU0OTM@._V1_UY268_CR5,0,182,268_AL_.jpg", comedian_id: 5},
  {title: "Dave Chappelle: For What It's Worth", runtime: 60, thumbnail: "https://m.media-amazon.com/images/M/MV5BZGQ2MjBjNDEtYWVlNi00Nzc3LTg2NjUtYWY3ZTkwNTAwNDQyXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_UY268_CR4,0,182,268_AL_.jpg", comedian_id: 5},
  {title: "Dave Chappelle: Killin' Them Softly", runtime: 57, thumbnail: "https://m.media-amazon.com/images/M/MV5BMTcyOGMxN2MtYzUwYy00YzQxLTgwZTItZjAxZTIzYWM1YzEyXkEyXkFqcGdeQXVyNjExODE1MDc@._V1_UX182_CR0,0,182,268_AL_.jpg", comedian_id: 5},
  {title: "Steve Martin: A Wild and Crazy Guy", runtime: 60, thumbnail: "https://m.media-amazon.com/images/M/MV5BNjk2MDk4Njk3M15BMl5BanBnXkFtZTgwNDYxMDA2MDE@._V1_UY268_CR9,0,182,268_AL_.jpg", comedian_id: 6},
  {title: "Steve Martin: Comedy Is Not Pretty", runtime: 60, thumbnail: "https://m.media-amazon.com/images/M/MV5BNjk2MDk4Njk3M15BMl5BanBnXkFtZTgwNDYxMDA2MDE@._V1_UY268_CR9,0,182,268_AL_.jpg", comedian_id: 6},
  {title: "All Commercials... A Steve Martin Special", runtime: 60, thumbnail: "https://m.media-amazon.com/images/M/MV5BNjk2MDk4Njk3M15BMl5BanBnXkFtZTgwNDYxMDA2MDE@._V1_UY268_CR9,0,182,268_AL_.jpg", comedian_id: 6},
  {title: "A Steven Wright Special", runtime: 60, thumbnail: "https://m.media-amazon.com/images/M/MV5BODUyOTI4NWEtMzZjOS00ZGJjLTk5NzQtYzEwNGE1YjI2NGVmXkEyXkFqcGdeQXVyMzM5NDYyMjE@._V1_UY268_CR43,0,182,268_AL_.jpg", comedian_id: 7},
  {title: "Steven Wright: When the Leaves Blow Away", runtime: 43, thumbnail: "https://m.media-amazon.com/images/M/MV5BMTg1OTA4MjU0N15BMl5BanBnXkFtZTcwODc1NzU0MQ@@._V1_UY268_CR4,0,182,268_AL_.jpg", comedian_id: 7},
  {title: "Steven Wright: Wicker Chairs and Gravity", runtime: 60, thumbnail: "http://www.frogriot.com/wp-content/themes/semplice/images/no_thumb.png", comedian_id: 7},
  {title: "Billy Connolly: High Horse Tour Live", runtime: 96, thumbnail: "https://m.media-amazon.com/images/M/MV5BMDc3NmRlMjQtMWU3OC00N2YwLWJkNzktNjBkNjdkOTA3YjcyL2ltYWdlXkEyXkFqcGdeQXVyNTM3MDMyMDQ@._V1_UY268_CR9,0,182,268_AL_.jpg", comedian_id: 8},
  {title: "Billy Connolly: Was It Something I Said?", runtime: 125, thumbnail: "https://m.media-amazon.com/images/M/MV5BNjFlMTMxYjctZjE5My00MzAwLWI4YWYtOWIxNzY4NDg2MTZhXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_UY268_CR15,0,182,268_AL_.jpg", comedian_id: 8},
  {title: "Billy Connolly: Live in New York", runtime: 92, thumbnail: "https://m.media-amazon.com/images/M/MV5BMjA5NTM2MzAyNF5BMl5BanBnXkFtZTcwOTc5ODIzMQ@@._V1_UY268_CR4,0,182,268_AL_.jpg", comedian_id: 8},
  {title: "Hasan Minhaj: Homecoming King", runtime: 73, thumbnail: "https://m.media-amazon.com/images/M/MV5BOWU2NTFjYTAtNDVkOC00YjJiLTg0NWMtODVmYzYwYjBiMmI3XkEyXkFqcGdeQXVyMjYwMTkwNDc@._V1_UY268_CR10,0,182,268_AL_.jpg", comedian_id: 9},
  {title: "Mike Birbiglia: Thank God for Jokes", runtime: 70, thumbnail: "https://m.media-amazon.com/images/M/MV5BNjM1NjNjOTUtMzk3Yi00NzZmLTg3NTQtZjE0N2U1MTYyZTViXkEyXkFqcGdeQXVyNDQyODU5MDQ@._V1_UX182_CR0,0,182,268_AL_.jpg", comedian_id: 10},
  {title: "Mike Birbiglia: My Girlfriend's Boyfriend", runtime: 76, thumbnail: "https://m.media-amazon.com/images/M/MV5BMTU0OTMzNDUyNV5BMl5BanBnXkFtZTgwMDYxNjkyMjE@._V1_UY268_CR4,0,182,268_AL_.jpg", comedian_id: 10},
  {title: "Jerrod Carmichael: 8", runtime: 59, thumbnail: "https://m.media-amazon.com/images/M/MV5BMWJkMzllOWQtZWQyZC00YTE0LWI5N2QtNzliYzZjMDJmOWFmXkEyXkFqcGdeQXVyMjExNDAyOTU@._V1_UX182_CR0,0,182,268_AL_.jpg", comedian_id: 11},
  {title: "Jerrod Carmichael: Love at the Store", runtime: 54, thumbnail: "https://m.media-amazon.com/images/M/MV5BNTI5ODAwNDY2NV5BMl5BanBnXkFtZTgwMDk0NjQ3NTE@._V1_UY268_CR9,0,182,268_AL_.jpg", comedian_id: 11},
  {title: "Tracy Morgan: Staying Alive", runtime: 60, thumbnail: "https://m.media-amazon.com/images/M/MV5BNWNmOWUyNjgtY2E0Ny00NTgyLWE3ZWMtZmFlNmY0NjM2Mjc3XkEyXkFqcGdeQXVyNjc5MDk0MzA@._V1_UY268_CR4,0,182,268_AL_.jpg", comedian_id: 12},
  {title: "Tracy Morgan: Bona Fide", runtime: 60, thumbnail: "https://m.media-amazon.com/images/M/MV5BMTkwMTMwNzE2MV5BMl5BanBnXkFtZTgwNzMxNDg2MTE@._V1_UY268_CR1,0,182,268_AL_.jpg", comedian_id: 12},
  {title: "Tracy Morgan: Black and Blue", runtime: 58, thumbnail: "https://m.media-amazon.com/images/M/MV5BMjIyMzM1NDYyN15BMl5BanBnXkFtZTcwMzMyNzkxNQ@@._V1_UY268_CR9,0,182,268_AL_.jpg", comedian_id: 12}
]

comedians.each do |c|
  Comedian.create(c)
end

specials.each do |s|
  Special.create(s)
end
