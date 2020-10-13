- Design tables & associations √
- Sketch wireframes(follow videos)  √
- MVC 
- Set Migrations - tables and attributes √
- Set Models - Validations
- Set Controllers - Include CRUD notes

Breakdown

- Migrations - 3 Tables √
    Astrophotographer - user_name, password_digest √
Stargazing - astrophotographer_id, constellation_id, location, weather, time √
    Constellation - name, description, light_years_away_from_earth, img_url
- Update the seed file √

- Model(3) - Astrophotographer, Stargazing, Constellation
    Associations 
    validations

- Controllers(4)
    Astrophotographers - User functionality: create user, login and password
    Constellations -
    Stargazings -
    Sessions -

- Views - Include partials, maybe nested forms

- Routes - nested routes

* May include Active Storage

association notes
- How can I create a new stargazing?
- How can I query the astrophotographer of a stargazing?
- How can I find all the constellations of the astrophotographer's    stargazings? 

Astrophotographer 
- Has many :stargazings
- Has many :constellations through: :stargazing
- show the constellations of all the astrophotographers

Constellation
- has many :stargazings 
- has many :Astrophotographers through: :stargazings 

Stargazings
- belongs_to :Astrophotographer
- belongs_to :Stargazings

Update

Step 1
user crud, sessions, authentication
user profile with image and bio
* Apply active storage (maybe)

Step 2
Include validations in all models 
Constellation & Stargazing - CRUD & associations
views page - form partials, errors messages

Step 3 
ActiveRecord scope method
Omniauth √
Refactor code


