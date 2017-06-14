# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command (or created
# alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Creating an entry of seed data to represent
# each state in United States of America
states = [
  { name: 'Alabama',              name_abbr: 'AL' },
  { name: 'Alaska',               name_abbr: 'AK' },
  { name: 'Arizona',              name_abbr: 'AZ' },
  { name: 'Arkansas',             name_abbr: 'AR' },
  { name: 'California',           name_abbr: 'CA' },
  { name: 'Colorado',             name_abbr: 'CO' },
  { name: 'Connecticut',          name_abbr: 'CT' },
  { name: 'Delaware',             name_abbr: 'DE' },
  { name: 'Florida',              name_abbr: 'FL' },
  { name: 'Georgia',              name_abbr: 'GA' },
  { name: 'Hawaii',               name_abbr: 'HI' },
  { name: 'Idaho',                name_abbr: 'ID' },
  { name: 'Illinois',             name_abbr: 'IL' },
  { name: 'Indiana',              name_abbr: 'IN' },
  { name: 'Iowa',                 name_abbr: 'IA' },
  { name: 'Kansas',               name_abbr: 'KS' },
  { name: 'Kentucky',             name_abbr: 'KY' },
  { name: 'Louisiana',            name_abbr: 'LA' },
  { name: 'Maine',                name_abbr: 'ME' },
  { name: 'Maryland',             name_abbr: 'MD' },
  { name: 'Massachusetts',        name_abbr: 'MA' },
  { name: 'Michigan',             name_abbr: 'MI' },
  { name: 'Minnesota',            name_abbr: 'MN' },
  { name: 'Mississippi',          name_abbr: 'MS' },
  { name: 'Missouri',             name_abbr: 'MO' },
  { name: 'Montana',              name_abbr: 'MT' },
  { name: 'Nebraska',             name_abbr: 'NE' },
  { name: 'Nevada',               name_abbr: 'NV' },
  { name: 'New Hampshire',        name_abbr: 'NH' },
  { name: 'New Jersey',           name_abbr: 'NJ' },
  { name: 'New Mexico',           name_abbr: 'NM' },
  { name: 'New York',             name_abbr: 'NY' },
  { name: 'North Carolina',       name_abbr: 'NC' },
  { name: 'North Dakota',         name_abbr: 'ND' },
  { name: 'Ohio',                 name_abbr: 'OH' },
  { name: 'Oklahoma',             name_abbr: 'OK' },
  { name: 'Oregon',               name_abbr: 'OR' },
  { name: 'Pennsylvania',         name_abbr: 'PA' },
  { name: 'Rhode Island',         name_abbr: 'RI' },
  { name: 'South Carolina',       name_abbr: 'SC' },
  { name: 'South Dakota',         name_abbr: 'SD' },
  { name: 'Tennessee',            name_abbr: 'TN' },
  { name: 'Texas',                name_abbr: 'TX' },
  { name: 'Utah',                 name_abbr: 'UT' },
  { name: 'Vermont',              name_abbr: 'VT' },
  { name: 'Virginia',             name_abbr: 'VA' },
  { name: 'Washington',           name_abbr: 'WA' },
  { name: 'West Virginia',        name_abbr: 'WV' },
  { name: 'Wisconsin',            name_abbr: 'WI' },
  { name: 'Wyoming',              name_abbr: 'WY' }
]

State.delete_all

State.create! states

employees = [
  {
    name: 'Queen Bee',        house_num: '123',
    street_name: 'Fair Ave.', city: 'Fairview',
    state_id: 1,              zip_code: '45678'
  },
  {
    name: 'Bruce Banner',       house_num: '345',
    street_name: 'Miller St.',  city: 'Taho',
    state: (State.find 30), zip_code: '10002'
  }
]

Employee.delete_all

Employee.create! employees
