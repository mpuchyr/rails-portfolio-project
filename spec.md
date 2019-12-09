# Specifications for the Rails Assessment

Specs:
- [X] Using Ruby on Rails for the project
- [X] Include at least one has_many relationship (user has many photoshoots, location has many photoshoots)
- [X] Include at least one belongs_to relationship (photoshoot belongs to user, photoshoot belongs to location)
- [X] Include at least one has_many through relationship (user has many locations through photoshoots, and vice versa)
- [X] The "through" part of the has_many through includes at least one user submittable attribute (user can submit location name)
- [X] Include reasonable validations for simple model objects (User, Photoshoot, Location)
- [X] Include a class level ActiveRecord scope method (filter on user's show page allows user to display photoshoots that fit specific criteria)
- [X] Include a nested form writing to an associated model using a custom attribute writer (user can submit location name on new photoshoot form)
- [X] Include signup (how e.g. Devise)
- [X] Include login (how e.g. Devise)
- [X] Include logout (how e.g. Devise)
- [X] Include third party signup/login (omniauth-facebook)
- [X] Include nested resource show or index
- [X] Include nested resource "new" form
- [X] Include form display of validation errors (/photoshoots/new)

Confirm:
- [X] The application is pretty DRY
- [X] Limited logic in controllers
- [X] Views use helper methods if appropriate
- [X] Views use partials if appropriate
