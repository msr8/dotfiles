import requests as rq

username = 'msr8'

query = '''
query userProfileCalendar($username: String!, $year: Int) {
    matchedUser(username: $username) {
        userCalendar(year: $year) {
            streak
            totalActiveDays
        }
    }
}
'''

payload = {'query':query, 'variables': {'username':username}}
r = rq.post("https://leetcode.com/graphql", json=payload)
print(r.json())



'''
If having problems, change the following shit:

payload = {
    'query':query,
    'variables': {'username':username},
    'operationName': 'userProfileCalendar'
}
headers = {"Content-Type":"application/json","Accept":"application/json"}
r = rq.post("https://leetcode.com/graphql", json=payload, headers=headers)
'''
