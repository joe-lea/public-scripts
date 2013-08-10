def spotify(action) 
  `osascript /Users/jlea/Downloads/SpotifyControl-master/SpotifyControl.scpt #{action.to_s}`
end

def play(track)
  `open #{track}`
end

def wait_till_track_finishes
  info = spotify :info
  while not info.empty? 
    info = spotify :info
    if paused?(info) 
      exit
    end
    sleep 1
  end
end

def paused?(info)
  paused = info.match "paused"
  return paused
end

tracks = %w{
  spotify:track:5UV2naBO7IbNYNxZjcuWxd
  spotify:track:6lZkk4Mw5BdaVnFbbHWuCP
  spotify:track:5IOTOkCKugylB5qA1nuOKY
  spotify:track:1ARpdDKN5sT6zPJaOf3O5F
  spotify:track:1PPK1X9SCIoa0IDadt6ztH
  spotify:track:1fkYWn3gXiFHGQAXJCEdPS
  spotify:track:4FnbRoPRFZaVFOfYwIa5Fv
  spotify:track:4wS5LA1foHMcxd8C1xcbf5
  spotify:track:0F2lR2lRl4EkSoSvF5RUW0
  spotify:track:1o69mpYAWZBgKnWlSkc9CG
  spotify:track:1UMvwF4tb9EoHJF75Av5Cy
  spotify:track:1osr4HV8Mnhn1ZIMwsP1Ju
  spotify:track:4tMOR7UyvXCK0OtTtMaSdQ
  spotify:track:1LuOa2lY2EBvdVAzXpydTM
  spotify:track:4tMOR7UyvXCK0OtTtMaSdQ
  spotify:track:1LuOa2lY2EBvdVAzXpydTM
  spotify:track:55Xmw4ktRJg9dY1LPZgX4x
  spotify:track:0cFlrika7XOFWD2mMFLLkb
  spotify:track:5nv854ey1k43KaZ0kHmE4Z
  spotify:track:3FtYbEfBqAlGO46NUDQSAt
}

tracks.shuffle.each do |track|
  play(track)
  wait_till_track_finishes()
end
