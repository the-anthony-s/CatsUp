## JSON response wrapper
- attach the link here + explain why


## USERS
Model test: PASS (2)
Routes test: PASS (6)


### list all users
```curl http://localhost:3000/users```

### show list of selected users
```curl http://localhost:3000/users?ids=:id,:id,:id```

### create new user
```curl -i -X POST -H "Content-Type:application/json" http://localhost:3000/users -d '{"name": "...", "email": "..."}'```

### show user
```curl http://localhost:3000/users/:id```

### update user
```curl -i -X PUT -H "Content-Type:application/json" http://localhost:3000/users/:id -d '{"name": "...", "email": "..."}'```

### destroy user
```curl -i -X DELETE http://localhost:3000/users/:id```