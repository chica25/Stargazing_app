MVC
Model(3) - Astrophotographer, Stargazing, Constellation
Associations

Migrations(3)
Astrophotographer - user_name, password_digest
Stargazing - astrophotographer_id, constellation_id, location, weather, time
Constellation - name, description, light_years_away_from_earth, img_url

Controller(3)
Astrophotographers_controller: create user, login and password
Constellations_controller, stargazings_controller
Views
