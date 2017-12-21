# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



resource = Resource.new
resource.name = "The Oxford Counselling And Psychotherapy Service"
resource.about = "The Oxford Counselling and Psychotherapy Service was founded in 1994. They are a network of 10 psychotherapists and counsellors who are all fully qualified, experienced and accredited with either the United Kingdom Council for Psychotherapy (UKCP) or the British Association for Counselling and Psychotherapy (BACP)."
resource.what_they_do = "Private therapy sessions (the type of therapy offered (e.g. Cognitive Behavioural Therapy) will vary depending on the individual)"
resource.tip = "You can self-refer, and there's usually no waiting list, so you can access this service really quickly."
resource.website = "http://www.oxfordcounselling.co.uk"
resource.contacts_as_string = "Gina Wilson: 01865 515324;Sheila Harris: 01865 865927"
resource.email = "info@oxfordcounselling.co.uk"
resource.photo_url = "logo_knuagr.gif"
resource.save
