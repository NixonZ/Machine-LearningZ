# -*- coding: utf-8 -*-
"""
Created on Tue Dec 11 13:15:06 2018

@author: Nalin Shani
"""

users = [
{ "id": 0, "name": "Hero" },
{ "id": 1, "name": "Dunn" },
{ "id": 2, "name": "Sue" },
{ "id": 3, "name": "Chi" },
{ "id": 4, "name": "Thor" },
{ "id": 5, "name": "Clive" },
{ "id": 6, "name": "Hicks" },
{ "id": 7, "name": "Devin" },
{ "id": 8, "name": "Kate" },
{ "id": 9, "name": "Klein" }
]
friendships = [(0, 1), (0, 2), (1, 2), (1, 3), (2, 3), (3, 4),(4, 5), (5, 6), (5, 7), (6, 8), (7, 8), (8, 9)]

#we add a list of friends to each user
for user in users:
    user["friends"]=[]
for i,j in friendships:
    users[i]["friends"].append(users[j])
    users[j]["friends"].append(users[i])

#What is the average number of connections?
def number_of_friends(user):
    return len(user["friends"])
total_connections=sum(number_of_friends(x) for x in users)
average_friends=float(total_connections/len(users))
print(average_friends)

#We can sort users on basis of number of friends they have
'''num_friends_by_id=[(user["id"],number_of_friends(user)) for user in users]
def ret_num_friends(user):
    return(user[1])
sorted(num_friends_by_id,key=ret_num_friends,reverse=True)'''

#friend of a friend
def friends_of_friend(user):
    return[foaf["id"] for friend in user["friends"] for foaf in friend["friends"]]
print(friends_of_friend(users[0]))


#Mutual friends-friends of friends which are not me or my friends
def not_the_same(user,other_user):
    return user["id"]!=other_user["id"]
def not_friends(user,other_user):
    if other_user in user["friends"]:
        return 0
    else:
        return 1
def mutual_friends(user):
    count=0
    for friend in user["friends"]:
        for foaf in friend["friends"]:
            if not_the_same(foaf,user) and not_friends(foaf,user):
                count+=1
    return count
print(mutual_friends(users[3]))


#Now we get data with the interests of an individual
interests = [
(0, "Hadoop"), (0, "Big Data"), (0, "HBase"), (0, "Java"),
(0, "Spark"), (0, "Storm"), (0, "Cassandra"),
(1, "NoSQL"), (1, "MongoDB"), (1, "Cassandra"), (1, "HBase"),
(1, "Postgres"), (2, "Python"), (2, "scikit-learn"), (2, "scipy"),
(2, "numpy"), (2, "statsmodels"), (2, "pandas"), (3, "R"), (3, "Python"),
(3, "statistics"), (3, "regression"), (3, "probability"),
(4, "machine learning"), (4, "regression"), (4, "decision trees"),
(4, "libsvm"), (5, "Python"), (5, "R"), (5, "Java"), (5, "C++"),
(5, "Haskell"), (5, "programming languages"), (6, "statistics"),
(6, "probability"), (6, "mathematics"), (6, "theory"),
(7, "machine learning"), (7, "scikit-learn"), (7, "Mahout"),
(7, "neural networks"), (8, "neural networks"), (8, "deep learning"),
(8, "Big Data"), (8, "artificial intelligence"), (9, "Hadoop"),
(9, "Java"), (9, "MapReduce"), (9, "Big Data")
]

#I can the users with a particular interests
def users_who_like(particular_interest):
    return [user_id for user_id,interest in interests if interest==particular_interest]

#More practical to sort by interests
from collections import defaultdict
user_ids_by_interest=defaultdict(list)
for user_id,interest in interests:
    user_ids_by_interest[interest].append(user_id)
