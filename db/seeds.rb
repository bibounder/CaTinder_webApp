User.create!(name: 'admin', email: 'admin@lesamisdepepito.fr', password: 'imadmin', role: User::ROLE_ADMIN, has_exterior: true, pet_number: 0)
User.create!(name: 'staff', email: 'staff@lesamisdepepito.fr', password: 'imstaff', role: User::ROLE_STAFF, has_exterior: true, pet_number: 0)
User.create!(name: 'user', email: 'user@lesamisdepepito.fr', password: 'imuser', role: User::ROLE_USER, has_exterior: true, pet_number: 0)

race1 = Race.create!(name: 'Siamois')
race2 = Race.create!(name: 'Europeen')

cat1 = Cat.create!(race: race1, name: 'social && outside', wants_outside: true, sociable: true, age: 5, gender: 0)
cat2 = Cat.create!(race: race1, name: 'social && !outside', wants_outside: false, sociable: true, age: 5, gender: 0)
cat3 = Cat.create!(race: race2, name: '!social && outside', wants_outside: true, sociable: false, age: 5, gender: 0)
cat4 = Cat.create!(race: race2, name: '!social && !outside', wants_outside: false, sociable: false, age: 5, gender: 0)