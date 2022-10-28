import mysql.connector as mysqlpy, math, random

user = 'root'
password = 'example'
host = 'localhost'
port = '3307'
database = 'apprenants'

bdd = mysqlpy.connect(user=user, password=password, host=host, port=port, database=database)
cursor = bdd.cursor()

persons = []
query="select prenom_apprenant from etudiant"
cursor.execute(query)
for prenom_apprenant in cursor:
    persons.append(prenom_apprenant[0])
print(persons)

persons_by_team = int(input('entrer un nombre de personne par équipe:'))

number_of_teams = math.ceil(len(persons) / persons_by_team)
teams = [[] for i in range(number_of_teams)] 

for person in persons: 
    random_team = random.randint(0, number_of_teams - 1)
    while len(teams[random_team]) >= persons_by_team: 
        random_team = random.randint(0, number_of_teams - 1) 
    
    teams[random_team].append(person)
    print(person + " in team " + str(random_team))

print(teams)

cursor.close()
bdd.close()