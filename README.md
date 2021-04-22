## JSON response wrapper
- attach the link here + explain why


## USERS
Model test (2): PASS
Routes test (6): PASS
Requests test (11): PASS


### list all users
```curl http://localhost:3000/users```

### show selected users
```curl http://localhost:3000/users?ids=:id,:id,:id```

### create new user
```curl -i -X POST -H "Content-Type:application/json" http://localhost:3000/users -d '{"name": "...", "email": "..."}'```

### show user
```curl http://localhost:3000/users/:id```

### update user
```curl -i -X PUT -H "Content-Type:application/json" http://localhost:3000/users/:id -d '{"name": "...", "email": "..."}'```

### destroy user
```curl -i -X DELETE http://localhost:3000/users/:id```

--------------

## CHANNELS

#### Get Chat Rooms
```curl http://localhost:3000/channels```

#### Show Chat Room
```curl http://localhost:3000/channels/1```

#### Search Chat Rooms
This is use for asyncronous search of users. In case it doesn't find any user will return empty array `[]`.
```curl http://localhost:3000/channels/search?name=Sport```

#### Create Chat Room
```curl -i -X POST -H "Content-Type:application/json" http://localhost:3000/channels -d '{"name": "games", "created_id": 1, "sender_id": 1, "recipient_id": 1}'``` 

#### Update Chat Room
```curl -i -X PUT -H "Content-Type:application/json" http://localhost:3000/channels/1 -d '{"name": "games", "created_id": 1, "sender_id": 1, "recipient_id": 1}'```

#### Delete Chat Room
```curl -i -X DELETE http://localhost:3000/channels/1```