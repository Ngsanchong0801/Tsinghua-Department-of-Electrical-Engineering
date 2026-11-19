import random

class Animal:
    def __init__(self, id, name, life, power, weight, pos):
        self.id = id
        self.name = name
        self.life = life
        self.power = power
        self.weight = weight
        self.pos = pos

    def move(self, pos):
        self.pos = pos

    def attack(self, target):
        print(f"{self.name} attacks {target.name}")
        target.life -= self.power

class Human(Animal):
    def __init__(self, id, name, life, power, weight, pos, father, mother):
        super().__init__(id, name, life, power, weight, pos)
        self.father = father
        self.mother = mother

    def shout(self, info):
        print(f"{self.name} shouts: {info}")

class Dog(Animal):
    def __init__(self, id, name, life, power, weight, pos, price):
        super().__init__(id, name, life, power, weight, pos)
        self.price = price

    def bark(self, info):
        print(f"{self.name} barks: {info}")

def generate_animals():
    animals = []
    for i in range(1, 11):
        animal_id = i
        animal_name = f"Animal {i}"
        animal_life = random.randint(5,20 )
        animal_power = random.randint(5, 10)
        animal_weight = random.randint(10, 30)
        animal_pos = random.randint(1, 10)
        animal = Animal(animal_id, animal_name, animal_life, animal_power, animal_weight, animal_pos)
        animals.append(animal)
    return animals

def generate_humans():
    humans = []
    for i in range(1, 11):
        human_id = i
        human_name = f"Human {i}"
        human_life = random.randint(10, 30)
        human_power = random.randint(1, 5)
        human_weight = random.randint(30, 50)
        human_pos = random.randint(1, 10)
        human_father = f"Father {i}"
        human_mother = f"Mother {i}"
        human = Human(human_id, human_name, human_life, human_power, human_weight, human_pos, human_father, human_mother)
        humans.append(human)
    return humans

def generate_dogs():
    dogs = []
    for i in range(1, 11):
        dog_id = i
        dog_name = f"Dog {i}"
        dog_life = random.randint(5, 20)
        dog_power = random.randint(5, 10)
        dog_weight = random.randint(10, 30)
        dog_pos = random.randint(1, 10)
        dog_price = random.randint(100, 1000)
        dog = Dog(dog_id, dog_name, dog_life, dog_power, dog_weight, dog_pos, dog_price)
        dogs.append(dog)
    return dogs

def simulate_battle(animals1, animals2):
    round_count = 1
    while True:
        print(f"Round {round_count}:")
        if len(animals1) == 0:
            if len(animals2) == 0:
                print("同時落敗")
            else:
                print("Team 2 wins!")
            break
        elif len(animals2) == 0:
            print("Team 1 wins!")
            break

        animal1 = random.choice(animals1)
        animal2 = random.choice(animals2)

        if isinstance(animal1, Human) and isinstance(animal2, Dog):
            animal1.attack(animal2)
            if animal2.life <= 0:
                animals2.remove(animal2)
        elif isinstance(animal1, Dog) and isinstance(animal2, Human):
            animal2.attack(animal1)
            if animal1.life <= 0:
                animals1.remove(animal1)
        elif isinstance(animal1, Animal) and isinstance(animal2, Animal):
            animal1.attack(animal2)
            if animal2.life <= 0:
                animals2.remove(animal2)
                if animal1.life <= 0:
                    animals1.remove(animal1)
        else:
            print("無效")
            break

        print(f"{animal1.name} life: {animal1.life}")
        print(f"{animal2.name} life: {animal2.life}")
        print()

        round_count += 1

animals1 = generate_animals()
animals2 = generate_animals()
humans1 = generate_humans()
dogs1 = generate_dogs()

simulate_battle(animals1, animals2)
simulate_battle(humans1, dogs1)