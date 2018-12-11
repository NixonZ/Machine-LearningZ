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

'''#We can sort users on basis of number of friends they have
num_friends_by_id=[(user["id"],number_of_friends(user)) for user in users]
def ret_num_friends(user):
    return(user[1])
sorted(num_friends_by_id,key=ret_num_friends,reverse=True)'''

#friend of a friend
def friends_of_friend(user):
    return[foaf["id"] for friend in user["friends"] for foaf in friend["friends"]]
print(friends_of_friend(users[0]))


#Mutual friends
