def pet_shop_name(pet_shop)
    return pet_shop[:name]
end

def total_cash(pet_shop)
  sum = 0
  sum += pet_shop[:admin][:total_cash]
  return sum
end

def add_or_remove_cash(pet_shop, sum)
  pet_shop[:admin][:total_cash] += sum
end

def pets_sold(pet_shop)
  pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, num_sold)
  pet_shop[:admin][:pets_sold] += num_sold
end

def stock_count(pet_shop)
  pet_shop[:pets].count
end

def pets_by_breed(pet_shop, breed)
  pets = []
  for pet in pet_shop[:pets]
    if breed == pet[:breed]
    pets.push(pet[:breed])
    end
  end
  return pets
end

def find_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if name == pet[:name]
      return pet
    end
  end
  nil
end

def remove_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
   if name == pet[:name]
   pet_shop[:pets].delete(pet)
   end
  end
  find_pet_by_name(pet_shop, name)
end

def add_pet_to_stock(pet_shop, new_pet)
  count = pet_shop[:pets].count
  pet_shop[:pets].push(new_pet)
  count
end

def customer_cash(customer)
  cash = customer[:cash]
end

def remove_customer_cash(customer, sum)
customer[:cash] -= sum
  return customer
end

def customer_pet_count(customer)
  customer[:pets].count
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
  customer
end

#  OPTIONAL

def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] >= new_pet[:price]
    return true
  else false
  end
end

# INTEGRATION TESTS

def sell_pet_to_customer(pet_shop, pet, customer)
while pet == true && customer_can_afford_pet(customer, pet) == true
customer_pet_count(customer) += 1
pets_sold(pet_shop) += 1
customer_cash(customer) -= pet[:price]
total_cash(pet_shop) += pet[:price]
end
end
