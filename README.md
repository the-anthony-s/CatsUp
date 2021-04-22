## JSON response wrapper
- attach the link here + explain why

## Tests
- attach links

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

#### Create Chat Room
```curl -i -X POST -H "Content-Type:application/json" http://localhost:3000/channels -d '{"name": "...", "user_id": ...}'``` 

#### Update Chat Room
```curl -i -X PUT -H "Content-Type:application/json" http://localhost:3000/channels/1 -d '{"name": "...", "user_id": ...}'```

#### Delete Chat Room
```curl -i -X DELETE http://localhost:3000/channels/1```

--------------

## MESSAGES

#### Get Messages
```curl http://localhost:3000/channels/[:channel_id]/messages```

#### Show Message
```curl http://localhost:3000/channels/[:channel_id]/messages/[:message_id]```

#### Create Message
```curl -i -X POST -H "Content-Type:application/json" http://localhost:3000/channels/[:channel_id]/messages -d '{"message": "Make Homestars better", "user_id": ...}'``` 

#### Update Message -> Setup for Front-end, task #4
```curl -i -X PUT -H "Content-Type:application/json" http://localhost:3000/channels/[:channel_id]/messages/[:message_id] -d '{"message": "Make Homestars even better", "user_id": ...}'``` 

#### Delete Message -> Setup for Front-end, task #5
```curl -i -X DELETE http://localhost:3000/channels/[:channel_id]/messages/[:message_id]```