Thank you for the project.

The idea was to create a Rails app separated from the `front-end` similarly to Airbnb or Netflix logic, using Rails on the `back-end` and React on the `front-end`.


## JSON response wrapper

You can notice that in all controllers, I use the `json_response` method. It's a wrapper that separates the JSON render logic. Ideally, I would use the Netflix approach; more information here: https://anmagpie.medium.com/rails-api-with-fastjson-from-netflix-e7bf4f4e5e7b . It will speed up the back-end process and help the servers to work more efficient.

More information about `json_response` method: https://github.com/the-anthony-s/CatsUp/blob/master/app/controllers/concerns/response.rb


## Tests

I use `RSpec` with `Redis`, `FactoryBot (aka FactoryGirl)`, and `DatabaseCleaner`. More information here:
https://github.com/the-anthony-s/CatsUp/tree/master/spec


---

# API

## Users

### List all users
```curl http://localhost:3000/users```

### List selected users
```curl http://localhost:3000/users?ids=:id,:id,:id```

### Create new user
```curl -i -X POST -H "Content-Type:application/json" http://localhost:3000/users -d '{"name": "...", "email": "..."}'```

### Show specific user
```curl http://localhost:3000/users/[:id]```

### Update user
```curl -i -X PUT -H "Content-Type:application/json" http://localhost:3000/users/:id -d '{"name": "...", "email": "..."}'```

### Destroy user
```curl -i -X DELETE http://localhost:3000/users/[:id]```

### Search user by name or (and) email
```curl http://localhost:3000/users/search?name=params[:name]&email=params[:email]```



## Channels

### Get Chat Rooms
```curl http://localhost:3000/channels```

### Show Chat Room
```curl http://localhost:3000/channels/[:id]```

### Create Chat Room
```curl -i -X POST -H "Content-Type:application/json" http://localhost:3000/channels -d '{"name": "...", "user_id": ..., "recipient_id": ...}'``` 

### Update Chat Room
```curl -i -X PUT -H "Content-Type:application/json" http://localhost:3000/channels/[:id] -d '{"name": "...", "user_id": ..., "recipient_id": ...}'```

### Delete Chat Room
```curl -i -X DELETE http://localhost:3000/channels/[:id]```

### Search channels by name
```curl http://localhost:3000/channels/search?name=params[:name]```



## MESSAGES

### Get Messages
```curl http://localhost:3000/channels/[:channel_id]/messages```

### Show Message
```curl http://localhost:3000/channels/[:channel_id]/messages/[:message_id]```

### Create Message
```curl -i -X POST -H "Content-Type:application/json" http://localhost:3000/channels/[:channel_id]/messages -d '{"message": "Make Homestars better", "user_id": ...}'``` 

### Update Message -> Setup for Front-end, task #4
```curl -i -X PUT -H "Content-Type:application/json" http://localhost:3000/channels/[:channel_id]/messages/[:message_id] -d '{"message": "Make Homestars even better", "user_id": ...}'``` 

### Delete Message -> Setup for Front-end, task #5
```curl -i -X DELETE http://localhost:3000/channels/[:channel_id]/messages/[:message_id]```


---


## DEMO

Heroku link: https://a917201999.herokuapp.com/

Example: ```curl https://a917201999.herokuapp.com/users/2```

> Please note that I am using a free server. The first server request may take some time to process.


Heroku database: ```postgres://sphvhbdezhtikd:93c91627e2b6524b75cf1864e25ef96b6259f9563cc07aa69106a027bf470095@ec2-3-217-219-146.compute-1.amazonaws.com:5432/dfp8t9s2qqqh15```


![dddd](https://media.giphy.com/media/PD9hjqdeidgqY/giphy-downsized.gif)


PS: 917201999 stands for [Pa][N][Ca][K][Es] ~ Chemistry :)

---

## Few words on which features were selected and why?

My goal was to focus on the core features of the web-chat application, such as messaging between users, adding and modifying channels, creating messages and updating them. In my opinion, these functions are the most important for the user.

Selected features:
1. As a consumer of the API, I can persist my chat messages
2. As a consumer of the API, I can persist messages in specific channels I join.
3. As a consumer of the API, I can see the List of all the available channels
4. As a consumer of the API, I can look up other users and channels
5. As a consumer of the API, I can see chat statistics of users and channels (partially)


## What's next?

1. Add better fields validations. For example, `email` format. Or even better would be to create an actual authentication model with `devise` gem and modify it to user `JSON tocken`.
2. Add option to make channels private or public.
3. Add sorting through `url` params. Example: `http://localhost:3000/users?region=params[:region]&time=params[:time]`
4. Add more statistics for each model (Region, IP address, Count private accounts, etc.)
5. Add `FastJSON` to serialize JSON responses (better performance)
6. Add the front-end part as a separate project.
