Feature: Spotify Arayuz Testi
  Background:
    * configure driver = {type: 'chromedriver' , executable: 'src/test/java/driver/chromedriver.exe'}
  Scenario: Spotify UI
    Given driver 'https://open.spotify.com/'
    And driver.maximize()
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
    And click("//span[@class='Type__TypeElement-goli3j-0 eHCcSU J4xXuqyaJnnwS6s2p3ZB standalone-ellipsis-one-line']")
    And delay(3000)
    And click("//h1[@class='Type__TypeElement-goli3j-0 hVBZRJ']")
    And delay(3000)
    And input("//input[@data-testid='playlist-edit-details-name-input']"," ")
    And delay(3000)
    And input("//input[@data-testid='playlist-edit-details-name-input']",'MentorLabs Challenge')
    And delay(3000)
    And click("//button[@data-testid='playlist-edit-details-save-button']")
    And delay(3000)
    And input('.Type__TypeElement-goli3j-0.ebHsEf.l42JW4EP_5CU1Ba7jYIc','Daft Punk')
    And delay(3000)
    And click("//button[@data-testid='add-to-playlist-button']").click()
    And delay(3000)
    Then position("//div[@data-testid='tracklist-row']/div[1]")
    And delay(2000)





