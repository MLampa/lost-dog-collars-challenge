-- 1. Which collars have a known owner? Display only collars with known owners and those owners' names.
#This tells us the dog lost dog collars that have their owners' names on them
#see .name with .dog_name
SELECT dog_owners.name, lost_dog_collars.dog_name
  FROM dog_owners
  JOIN lost_dog_collars
  ON (dog_owners.dog_name = lost_dog_collars.dog_name);

-- 2. For which collars is there no known owner? Display only collars without known owners.
#This tells us the names of dogs that don't have an owner
#see .dog_name but no .name
SELECT lost_dog_collars.dog_name
  FROM dog_owners
  JOIN lost_dog_collars
  ON (dog_owners.dog_name = lost_dog_collars.dog_name);

-- 3. What collars are in our possession? Display all collars in our possession. If an owner exists for a given collar, display that also.
#This tells us the names of the lost dog collars and see if there's an owner than matches
#see .dog_name from lost_dog_collars where there's a list from dog_owners, checking both databases for the same dog.name
SELECT lost_dog_collars.dog_name FROM lost_dog_collars
WHERE NOT EXISTS (SELECT * FROM dog_owners
  WHERE dog_owners.dog_name = lost_dog_collars.dog_name);


-- 4. What owners do we know about? Display all owners known to us. If a collar matches that owner, display the collar also.
#This shows us all dog owners and see if the collars match to the lost dog collars
#see .name to .dog_name, and all see if not blank statement
SELECT dog_owners.name, lost_dog_collars.dog_name
  FROM dog_owners
  FULL OUTER JOIN lost_dog_collars
  ON (dog_owners.dog_name = lost_dog_collars.dog_name) WHERE dog_owners.name IS NOT NULL;
