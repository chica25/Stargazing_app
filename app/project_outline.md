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
    Associations √
    validations √

- Controllers(4)
    Astrophotographers - User functionality: create user, login and password
    Constellations -
    Stargazings -
    Sessions -

- Views - Include partials, maybe nested forms

- Routes - nested routes


association notes
- How can I create a new stargazing?
- How can I query the astrophotographer of a stargazing?
- How can I find all the constellations and stargazings(maybe add a nested routes) of the astrophotographer? 

Step 1
user crud, sessions, authentication
user profile with image and bio √


Step 2
Include validations in all models - Missing nested form macro
Constellation & Stargazing - CRUD & associations
views page - form partials, errors messages

Step 3 
ActiveRecord scope method
Omniauth √
Refactor code


Additional notes

- user will have a profile that includes an image and bio, this will be shown in their homepage(root_path) and in the astrophotographers index page  
- current users can edit, update and delete their lists
- Create a nested form of the constellation and Stargazings - actions: All CRUD actions
- Add Astrophotographers, constellations and startgazings index pages to all pages. Maybe add included in the layouts page?



