Feature: Spotify Api Testi
  Background:
    * def urlHome = 'https://open.spotify.com/'
    * def userid = '31qn5vjhpdwawpgz2loltub6y6da'
    * def token = 'Bearer BQDxb1H5TPjpKlhG-F85IRBS1WC9jFDnb2PwtMIl8vA2sbzO5fgS7uAJm7bkv45eKCTRnp4WjZ6BYwimjXLt69-bL98YiqesVSb7R_dwgsTpdlH24oxfaWW00JTAEN3ywEVpIAVf_r8jOu5kHBDKksB_8Fank0JwXVnXeUrwKZ7SCkjxccB7WkOJtFTFrsyLpNsE8vGVat6MRVfUQAp7Iok2pcLlSpj3g7EfVLXX-wgdgCAeoUbBphg-78iCr0IjZQjCrfPYi-Z9Xd4ms2VB-mktkYok'
    * def requestbody =
 """
{
  "name": "MentorLabs Challenge",
  "description": "Challenge",
  "public": false
}
 """
    * def requestAdditembody =
 """
 {
  "uris": [
    "spotify:track:4u7EnebtmKWzUH433cf5Qv"
  ]
}
 """

  Scenario: Get Playlist User
    Given url 'https://api.spotify.com/v1/'
    And path '/me'
    And header Authorization = token
    When method get
    Given url 'https://api.spotify.com/v1/'
    And path '/users/'+userid+'/playlists'
    And header Authorization = token
    And request requestbody
    When method post
    Then def ListPlayID = response.id
    Given url 'https://api.spotify.com/v1/'
    And path '/search'
    And header Authorization = token
    And header Content-Type = 'application/json'
    And param q = 'Bohemian Rhapsody'
    And param type = 'track'
    When method get
    Given url 'https://api.spotify.com/v1/'
    And path '/playlists/'+ListPlayID+'/tracks'
    And header Authorization = token
    And header Content-Type = 'application/json'
    And request requestAdditembody
    When method post




