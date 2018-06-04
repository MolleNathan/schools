json.message @message
json.schools @schools.each do |school|
    json.name school.name
    json.adress school.adress
    json.zip_code school.zip_code
    json.city school.city
    json.schedule school.schedule
    json.phone_number school.phone_number
    json.email school.email
    json.nb_student school.nb_student
    json.status school.status
    json.latitude school.latitude
    json.longitude school.longitude
end