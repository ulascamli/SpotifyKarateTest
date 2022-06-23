Feature: Spotify Challenge Faz2
  Background:
    * configure driver = {type: 'chromedriver' , executable: 'src/test/java/driver/chromedriver.exe'}
    * def link = 'https://open.spotify.com/'
    * def kullaniciID = '31qn5vjhpdwawpgz2loltub6y6da'
    * def token = 'Bearer BQC0mtQreg8Cqrr8IHgSrgkPuvQHVTi6VdY7Sf1aZ9F0i8xk6rBaYZpbjqdy9UdjydrQoNWC5CkdSgM0-lb9uWQq162mR7SGAwsnTpWjAEAHY06xgKiaIGkLtc1REtBQjKrit4UEky6Ts8G25vVj0-iLFWI0Ucz-qwFMCeeV-YyPRdkbe3UOBbOe9nXvwWybFUp1wDPaMxv0Tux9tR7wGOLmClbd8X8_Tn7Zbrw0Dqf2vodfukQBC7l7A_kJ315bvDedwiH4LaO8Vs4jTeMTlRTcM860TA'
    * def currentToken = 'Bearer BQD3leZeaBi52WEdeQ-CHbAJt2EXcYUA_V_RUtNw6wZ0uypaL1RzMSAUbwtJqVapbgjO47bvD_BK_W7FLJnA9sVi90uBwDYz5YuaXAqpretkbqyWYcoju9y-srboZFyWZGVs28XzNNjMoLI740mfZ_L7Ouan1QtKrt4tI2whjODst8kKk3U4Yr_8TM3xqQGk_uzZWBYHpTGTa_dr2c9iRYOlEU4juPTwo3JxAMWTcRG2ZkPUj3RRCDnpgI04yTjkyy2kmH9s_Jmy57Nusvns-KKJsy__lQ'
    * def bodyIstekAtma =
     """
{
  "name": "MentorLabs Challenge Faz2",
  "description": "Challenge",
  "public": false
}
 """
    * def bodyEklemeIstegi =
 """
 {
  "uris": [
    "spotify:track:3MrRksHupTVEQ7YbA0FsZK"
  ]
}
 """
    Scenario: Spotify Karate Test
      Given driver 'https://open.spotify.com/'
      And driver.maximize()
      And delay(3000)
      And click("//button[@class='onetrust-close-btn-handler onetrust-close-btn-ui banner-close-button ot-close-icon']")
      And delay(3000)
      And click("//button[@data-testid='login-button']")
      And delay(3000)
      And click("//input[@id='login-username']")
      And delay(3000)
      And input('#login-username','ulas45155@gmail.com')
      And delay(3000)
      And input('#login-password','heygoogle1234')
      And delay(3000)
      And click("//button[@id='login-button']")
      And delay(3000)
      Given url 'https://api.spotify.com/v1/'
      And path '/me'
      And header Authorization = token
      When method get
      And match text("//span[text()='Sag Salim']") == 'Sag Salim'
      Given url 'https://api.spotify.com/v1/'
      And path '/users/'+kullaniciID+'/playlists'
      And header Authorization = token
      And request bodyIstekAtma
      When method post
      Then def ListPlayID = response.id
      Given url 'https://api.spotify.com/v1/'
      And path '/search'
      And header Authorization = token
      And header Content-Type = 'application/json'
      And param q = 'The Final Countdown'
      And param type = 'track'
      When method get
      And match text("//span[text()='MentorLabs Challenge Faz2']") == 'MentorLabs Challenge Faz2'
      Given url 'https://api.spotify.com/v1/'
      And path '/playlists/'+ListPlayID+'/tracks'
      And header Authorization = token
      And header Content-Type = 'application/json'
      And request bodyEklemeIstegi
      When method post
      And delay(6000)
      And click("//span[@class='Type__TypeElement-goli3j-0 lfGOlT VjIb8SfYTkc4wMpqqj3f'][1]")
      And delay(3000)
      And click("//div[@class='ButtonInner-sc-14ud5tc-0 gHYQaG encore-bright-accent-set']")
      And delay(10000)
      And click("//div[@class='ButtonInner-sc-14ud5tc-0 gHYQaG encore-bright-accent-set']")
      And delay(2000)
      Given url 'https://api.spotify.com/v1/'
      And path '/me/player/currently-playing'
      And header Authorization = currentToken
      And method get
      * def verifySong = karate.jsonPath(response,"$.['item']['name']")
      Then match verifySong == 'The Final Countdown'
      * print verifySong
      And click("//div[@style='transform: translateY(0px);']/div[3]")
      And delay(3000)
      And click("//button[@class='T0anrkk_QA4IAQL29get']")
      And delay(3000)
      And click("//span[text()='Sil']")
      And delay(3000)
      And click("//div[text()='SİL']")
      And delay(3000)
      And click("//span[text()='Ana sayfa']")
      And delay(2000)
      And click("//span[text()='Ara']")
      And delay(2000)
      And input('.Type__TypeElement-goli3j-0.ebHsEf.QO9loc33XC50mMRUCIvf','Suffocation Blues')
      And delay(2000)
      And click('._gB1lxCfXeR8_Wze5Cx9')
      And delay(2000)
      And click("//div[text()='Suffocation Blues']")
      And delay(2000)
      And click("//button[@tabindex='0']")
      And delay(2000)
      And click("//button[@class='Fm7C3gdh5Lsc9qSXrQwO control-button control-button-heart']")
      And delay(2000)
      And click("//span[text()='Beğenilen Şarkılar']")
      And delay(4000)
      And match text("//div[text()='Suffocation Blues']") == 'Suffocation Blues'
      And click("//div[@class='ButtonInner-sc-14ud5tc-0 gHYQaG encore-bright-accent-set']")
      And delay(2000)
      And click("//button[@class='Fm7C3gdh5Lsc9qSXrQwO tGKwoPuvNBNK3TzCS5OH rRF_r7EyCHjZv058JACi']")
      And delay(3000)
      And click("//button[@class='odcjv30UQnjaTv4sylc0']")
      And delay(3000)
      And click("//span[text()='Oturumu kapat']")
      And delay(3000)
      Then match text("//div[text()='Oturum aç']") == 'Oturum aç'

