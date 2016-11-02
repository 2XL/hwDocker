import redis


# connect to redis server

r = redis.StrictRedis(host='0.0.0.0', port=6379, db=0)


# increase the hit count for the user
def hit(user):
    r.incr(user)


# get the hit counter for the user
def get_hit(user):
    return r.get(user)
