API Endpoints

/all (GET REQUEST)
Gets a list of all the birds in the database.
Response - A JSON array of all bird objects.

/{birdId} (GET REQUEST)
Gets a single bird from the database given its unique ID.
Response - A unique bird

/name (GET REQUEST)
Gets a unique bird given a specified string.
Response - A JSON array of a bird.

/Description/{major} (GET REQUEST)
Gets a unique bird given its description.
Response - A JSON array of a bird description.

/new (POST REQUEST)
Create a new bird entry

Request Body
{
"name": "Blue jay",
"description": "Blue jays are natural forest dwellers, but they are also highly adaptable and intelligent birds." 
}

Response - The updated list of birds in the database.

/update/{birdID} (PUT REQUEST)
Update an existing bird's data.

Request Body
{ 
"birdId": 8890, 
"name": "Test Bird",
"description": "Tester, now with changes." 
}

/delete/{birdID} (DELETE REQUEST)
Delete an existing bird from the database.

Response - the updated list of birds.
