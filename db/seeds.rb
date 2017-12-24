# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Resource.destroy_all
SavedResource.destroy_all

resource = Resource.new
resource.name = "Carers Oxfordshire"
resource.about = "Carers Oxfordshire is a free service which offers information, advice and support to someone aged 18 and over, who is looking after someone aged 18 and over, living in Oxfordshire, who could not manage without this help."
resource.what_they_do = "A telephone and web-based information service

An outreach support service, providing advice and support over the phone and face-to-face

A network of peer support groups (find your nearest here)

Training and wellbeing opportunities"
resource.tip = "Found out about a carers support group or event? Send it in and they'll put it on their online calendar to share with other carers!"
resource.website = "http://www.carersoxfordshire.org/uk/cms/"
resouce.address = "Support groups take place at a variety of locations. Find your nearest here."
resource.contacts_as_string = "0345 050 7666"
resource.email = "carersoxfordshire@oxfordshire.gov.uk"
resource.photo_url = "logo_knuagr.gif"
resource.category = "Support Groups"
resource.taglines_as_string = "carers"
resource.save


resource = Resource.new
resource.name = "Restore"
resource.about = "Restore is an Oxfordshire-based mental health charity that supports people to take control of their recovery, develop skills and lead meaningful lives."
resource.what_they_do = "Run six different recovery groups that offer the chance to socialise and learn new skills

Offer free educational courses in association with Oxfordshire Recovery College on a range of subjects including ‘Understanding Psychosis’ and ‘Informing Choices: Anti-Depressants’

Offer employment coaching

"
resource.tip = "Restore's partnership with the Oxford Recovery College (ORC) offer courses that are a fantastic way for current or former service users to aid their recovery by learning about their own mental illness, medical choices and self-help strategies."
resource.website ="https://www.restore.org.uk/"
resource.contacts_as_string ="01865 455821"
resource.email = "information@restore.org.uk"
resource.address ="Restore, Manzil Way, Cowley Road, Oxford, OX4 1YH"
resource.photo_url = "qlyktbzxq3omzk0vlxrv.jpg"
resource.taglines_as_string = "rehabilitation"
resource.category = "Support Groups"
resource.save

resource = Resource.new
resource.name = "Oxford OCD Support Group"
resource.about = "This page is provides information for an independent, peer-led support group for those affected by OCD. It is an opportunity to share thoughts, ideas and strategies, and to provide mutual support. It is listed on OCD Action's website, but is not directly affiliated with them."
resource.what_they_do = "A support group for:

People with (or think they have) OCD

Family members

Carers

Friends

"
resource.tip = "If you can't travel to this support group, you can access 12 online support groups on the OCD action website."
resource.website = "http://www.ocdaction.org.uk/support-group/oxford-ocd-support-group"
resource.contacts_as_string = "07976726803"
resource.email = "ox.ocd.support@hotmail.com"
resource.photo_url = "CarersOxfordshire_qgfcfl.png"
resource.category = "Support Groups"
resource.address ="Restore, Michael Young Building, Manzil Way, Oxford, OX4 1YH"
resource.taglines_as_string ="OCD"
resource.save

