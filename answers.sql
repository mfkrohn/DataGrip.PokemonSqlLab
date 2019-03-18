# # What are all the types of pokemon that a pokemon can have?
SELECT name as Pokemon_Types
FROM pokemon.types;
#
# What is the name of the pokemon with id 45?
SELECT pokemons.name as 'Pokemon 45'
FROM pokemon.pokemons
WHERE id = 45;

# How many pokemon are there?
SELECT COUNT(*) as 'Number Of Pokemon'
FROM pokemon.pokemons;

# How many types are there?
SELECT COUNT(*) as 'Number Of Types'
FROM pokemon.types;

#How many pokemon have a secondary type?
SELECT COUNT(*) as 'Pokemon with Secondary Type'
FROM pokemon.pokemons
WHERE secondary_type IS NOT NULL;

# What is each pokemon's primary type?
SELECT p.name as 'Pokemon Name',types.name as 'Primary Type'
FROM pokemon.pokemons p, pokemon.types
WHERE p.primary_type = types.id;

# What is Rufflet's secondary type?
SELECT p.name as 'Pokemon Name', types.name as 'Seconadary Type'
FROM pokemon.pokemons p, pokemon.types
WHERE p.name = 'Rufflet' and p.secondary_type = types.id;

# What are the names of the pokemon that belong to the trainer with trainerID 303?
SELECT p.name as 'Trainer 303 Pokemon'
FROM pokemon.pokemons p, pokemon.pokemon_trainer
WHERE trainerID = 303 and pokemon_trainer.pokemon_id = p.id;

# How many pokemon have a secondary type Poison
SELECT COUNT(*) as 'Number of Pokemon with Secondary Type Poison'
FROM pokemon.pokemons,pokemon.types
WHERE secondary_type = types.id and types.name = 'Poison';

# What are all the primary types and how many pokemon have that type?
SELECT t.name as 'Primary Type Name', COUNT(p.name) as 'Number of Pokemon with This Type'
FROM pokemon.types t, pokemon.pokemons p
WHERE primary_type = t.id
group by t.name;

# How many pokemon at level 100 does each trainer with at least one
# level 100 pokemone have? (Hint: your query should not display a trainer
SELECT COUNT(*) as 'Number of Pokemon at Level 100'
FROM pokemon.pokemon_trainer pt
WHERE pt.pokelevel = 100
GROUP BY pt.trainerID;

# How many pokemon only belong to one trainer and no other?
SELECT COUNT(*) as Number_of_Pokemon_That_Belong_to_One_Trainer from(
SELECT Count(1) as u
From pokemon.pokemon_trainer pt
GROUP BY pokemon_id
HAVING u = 1)n;

# Part 4
SELECT p.name           as 'Pokemon Name',
       trainername    as 'Trainer Name',
       pokelevel      as 'level',
       t1.name     as 'Primary Type',
       t2.name as 'Secondary Type'

FROM pokemon.pokemon_trainer pt
     left outer join pokemon.trainers as t on t.trainerID = pt.trainerID
left outer join pokemon.pokemons as p on p.id = pt.pokemon_id
left outer join pokemon.types as t1 on p.primary_type = t1.id
left outer join pokemon.types as t2 on p.secondary_type = t2.id
order by level desc



















