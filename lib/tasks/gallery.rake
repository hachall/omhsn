require 'cloudinary'
require 'carrierwave'

namespace :photos do

  task build_gallery: :environment do

    Photo.destroy_all

    url = 'https://res.cloudinary.com/djdgvuktb/image/upload/v1515454318/26179954_10212897188318235_1804953203_o_rns3jv.jpg'
    photo = Photo.new(description: "20/10/16: OMHN's launch night")
    photo.remote_photo_url = url
    photo.save

    url = 'https://res.cloudinary.com/djdgvuktb/image/upload/v1515454318/26235708_10212897188278234_1616190843_o_l6mis3.jpg'
    photo = Photo.new(description: "20/10/16: Attendees check out resources at OMHN's launch night")
    photo.remote_photo_url = url
    photo.save

    url = 'https://res.cloudinary.com/djdgvuktb/image/upload/v1515454318/26179424_10212897188358236_701701645_o_acqhek.jpg'
    photo = Photo.new(description: "OMHN's Time to Talk Day poster")
    photo.remote_photo_url = url
    photo.save

    url = 'https://res.cloudinary.com/djdgvuktb/image/upload/v1515454319/26238192_10212897188238233_1383975698_o_ilvthl.jpg'
    photo = Photo.new(description: "02/02/17: Co-Chair Kathryn Cole (right) discussing Oxford’s mental health volunteering opportunities at OMHN's Time to Talk Day event")
    photo.remote_photo_url = url
    photo.save

    url = 'https://res.cloudinary.com/djdgvuktb/image/upload/v1515454317/26179042_10212897188198232_1164543493_o_kl8rj7.jpg'
    photo = Photo.new(description: "02/02/17: Keynote speaker Adrian Garcia (Commander-in-chief of SANE’s Black Dog Campaign) at discussing his work at OMHN's Time to Talk Day event")
    photo.remote_photo_url = url
    photo.save

    url = 'https://res.cloudinary.com/djdgvuktb/image/upload/v1515454318/26177875_10212897188438238_840741989_o_cxzijo.jpg'
    photo = Photo.new(description: "22/05/17: Co-Chair TJ Jordan discusses the work of OMHSN at a mental health communities event")
    photo.remote_photo_url = url
    photo.save

    url = 'https://res.cloudinary.com/djdgvuktb/image/upload/v1515454318/26178069_10212897188478239_1815298306_o_uah33l.jpg'
    photo = Photo.new(description: "07/06/17: Co-Chair TJ Jordan (far right) with the It Gets Brighter team at a drop-in support message recording session")
    photo.remote_photo_url = url
    photo.save

    url = 'https://res.cloudinary.com/djdgvuktb/image/upload/v1515454319/26178100_10212897188398237_2134033128_o_cye3yh.jpg'
    photo = Photo.new(description: "10/10/17: Co-Chairs TJ Jordan (right) and Kathryn Cole (left) with Oxfordshire Mind’s CEO Dan Knowles (centre) on World Mental Health Day")
    photo.remote_photo_url = url
    photo.save

  end


end
