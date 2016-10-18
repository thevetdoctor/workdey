class SeedData
  def users_list
    cloudinary_img_url =
      "http://res.cloudinary.com/dxoydowjy/image/upload/v1452076402/"\
    "rxxvqznd6ayvqlmxoon2.png"
    [
      { firstname: "Super", lastname: "Man",
        email: "morris.kimani@andela.com", street_address: nil,
        city: "Nairobi", state: nil, password: "1234567890",
        user_type: "admin", confirm_token: "112ewqee2123wqwqw12wq",
        confirmed: true },

      { firstname: "Olaide", lastname: "Ojewale",
        email: "olaide.ojewale@andela.com", street_address: "55 Moleye Street",
        city: "Yaba", state: "Lagos", password: "1234567890",
        user_type: "artisan", confirm_token: "112ewqee2123wqwqw12wq",
        confirmed: true, has_taken_quiz: true,
        image_url: cloudinary_img_url,
        latitude: "6.5001035", longitude: "3.376697",
        status: 0,
        reason: nil },
      { firstname: "Chinedu", lastname: "Daniel",
        email: "chinedu.daniel@andela.com", street_address: "55 Moleye Street",
        city: "Yaba", state: "Lagos", password: "1234567890",
        user_type: "tasker", confirmed: true,
        confirm_token: "112ewqee2123wqwqw12wq",
        image_url: cloudinary_img_url,
        latitude: "6.4994906", longitude: "3.3780381",
        status: 0,
        reason: nil },
      { firstname: "Temitope", lastname: "Amodu",
        email: "temitope.amodu@andela.com", street_address: "2 Funso Street",
        city: "Yaba", state: "Lagos", password: "1234567890",
        user_type: "tasker", confirmed: true,
        confirm_token: "112ewqee2123wqwqw12wq",
        image_url: cloudinary_img_url,
        latitude: "6.5066561", longitude: "3.3816401",
        status: 2,
        reason: "bad" },
      { firstname: "Ruth", lastname: "Chukwumam",
        email: "ruth.chukwumam@andela.com", street_address: "44 Isaac John",
        city: "GRA", state: "Lagos", password: "1234567890",
        user_type: "artisan", confirm_token: "112ewqee2123wqwqw12wq",
        confirmed: true, has_taken_quiz: true, image_url: cloudinary_img_url,
        latitude: "6.5275368", longitude: "3.367699",
        status: 1,
        reason: "good" },
      {
        firstname: "Hubert", lastname: "Nakitare",
        email: "hubert.nakitare@andela.com",
        street_address: "525, Kindaruma Road", city: "Nairobi",
        state: "Nairobi", password: "1234567890", user_type: "tasker",
        confirm_token: "112ewqee2123wqwqw12wq", image_url: cloudinary_img_url,
        latitude: "-1.297849", longitude: "36.7868873", confirmed: true,
        has_taken_quiz: true,
        status: 1,
        reason: "good"
      },

      {
        firstname: "Austin", lastname: "Powers",
        email: "austin.powers@andela.com", street_address: "530, Muranga Road",
        city: "Muranga", state: "Central", password: "1234567890",
        user_type: "artisan", confirm_token: "112ewqee2123wqwqw12wq",
        image_url: cloudinary_img_url,
        latitude: "-1.0385092", longitude: "37.0755163",
        status: 0,
        reason: nil
      },

      {
        firstname: "Robert", lastname: "Alai",
        email: "robert.alai@andela.com", street_address: "3, Kitale",
        city: "Kitale", state: "Busia", password: "1234567890",
        user_type: "artisan", confirm_token: "112ewqee2123wqwqw12wq",
        image_url: cloudinary_img_url,
        latitude: "1.0187148", longitude: "34.9920014",
        status: 0,
        reason: nil
      },

      {
        firstname: "Jill", lastname: "Scott",
        email: "jill.scott@andela.com", street_address: "Adams Arcade",
        city: "Kileleshwa", state: "Kiambu", password: "1234567890",
        user_type: "artisan", confirm_token: "112ewqee2123wqwqw12wq",
        image_url: cloudinary_img_url,
        latitude: "-1.2999473", longitude: "36.7809143",
        status: 0,
        reason: nil
      },
      {
        firstname: "Admin", lastname: "Workdey",
        email: "admin.workdey@andela.com", street_address: "Lambada",
        city: "Mombasa", state: "Mtwapa", password: "1234567890",
        user_type: "admin", confirm_token: "112ewqee2123wqwqw12wq",
        confirmed: true,
        image_url: cloudinary_img_url,
        latitude: "-3.9427", longitude: "39.7444",
        status: 3,
        reason: "admin"
      }
    ]
  end

  def skillsets
    [
      { name: "Carpentry" },
      { name: "Electrician" },
      { name: "Plumbing" },
      { name: "Cleaning" }
    ]
  end

  def user_plan
    [
      { user_id: 3, name: "novice" },
      { user_id: 2, name: "novice" }
    ]
  end

  def biddings
    Bidding.create(
      tasker_id: User.where(firstname: "Olaide").first.id,
      name: Faker::Lorem.word,
      description: Faker::Lorem.sentence(5),
      price_range: Faker::Number.number(4)
    )
  end

  def create_all
    User.destroy_all
    Skillset.destroy_all
    UserPlan.destroy_all
    Bidding.destroy_all
    ArtisanSkillset.destroy_all
    users_list.each { |user| User.create(user) }
    skillsets.each { |skill| Skillset.create(skill) }
    user_plan.each { |user| UserPlan.create(user) }
    artisan_skillsets.each { |tas_skillset| ArtisanSkillset.create(tas_skillset) }
    10.times { biddings }
  end

  def artisan_skillsets
    [
      { artisan_id: 1, skillset_id: 1 },
      { artisan_id: 1, skillset_id: 2 },
      { artisan_id: 4, skillset_id: 4 },
      { artisan_id: 1, skillset_id: 3 },
      { artisan_id: 6, skillset_id: 1 },
      { artisan_id: 7, skillset_id: 4 },
      { artisan_id: 7, skillset_id: 3 },
      { artisan_id: 8, skillset_id: 3 }
    ]
  end
end
workdey_data = SeedData.new
workdey_data.create_all

class DummyData
  def dummy_applicants_list
    cloudinary_img_url =
      "http://res.cloudinary.com/dxoydowjy/image/upload/v1452076402/"\
    "rxxvqznd6ayvqlmxoon2.png"
    [
      {
        firstname: "Ron", lastname: "Weasley",
        email: "ron.weasley@hogwarts.com", street_address: "7 Privet Drive",
        city: "Utopia", state: nil, password: "1234567890",
        user_type: "artisan", confirm_token: "112ewqee2123wqwqw12wq",
        image_url: cloudinary_img_url,
        latitude: "-1.2999473", longitude: "36.7809143", status: 1
      },

      {
        firstname: "Albus", lastname: "Dumbledore",
        email: "albus.dumbledore@hogwarts.com",
        street_address: "7 Privet Drive",
        city: "Utopia", state: nil, password: "1234567890",
        user_type: "artisan", confirm_token: "112ewqee2123wqwqw12wq",
        image_url: cloudinary_img_url,
        latitude: "-1.2999473", longitude: "36.7809143", status: 1
      },

      {
        firstname: "Lucius", lastname: "Malfoy",
        email: "lucius.malfoy@hogwarts.com", street_address: "7 Privet Drive",
        city: "Utopia", state: nil, password: "1234567890",
        user_type: "artisan", confirm_token: "112ewqee2123wqwqw12wq",
        image_url: cloudinary_img_url,
        latitude: "-1.2999473", longitude: "36.7809143", status: 1
      },

      {
        firstname: "Headless", lastname: "Nick",
        email: "headless.nick@hogwarts.com", street_address: "7 Privet Drive",
        city: "Utopia", state: nil, password: "1234567890",
        user_type: "artisan", confirm_token: "112ewqee2123wqwqw12wq",
        image_url: cloudinary_img_url,
        latitude: "-1.2999473", longitude: "36.7809143", status: 1
      },

      {
        firstname: "Harry", lastname: "Potter",
        email: "harry.potter@hogwarts.com", street_address: "7 Privet Drive",
        city: "Utopia", state: nil, password: "1234567890",
        user_type: "artisan", confirm_token: "112ewqee2123wqwqw12wq",
        image_url: cloudinary_img_url,
        latitude: "-1.2999473", longitude: "36.7809143", status: 1
      }
    ]
  end

  def vetting_records_list
    admin = User.find_by(user_type: "admin").id
    vetting_records = [
      {
        user_id: User.find_by(email: dummy_applicants_list[0][:email]).id,
        confidence: 3,
        skill_proficiency: 3,
        experience: 3,
        vetted_by: admin
      },

      {
        user_id: User.find_by(email: dummy_applicants_list[1][:email]).id,
        confidence: 3,
        skill_proficiency: 4,
        experience: 2,
        vetted_by: admin
      },

      {
        user_id: User.find_by(email: dummy_applicants_list[2][:email]).id,
        confidence: 1,
        skill_proficiency: 1,
        experience: 1,
        vetted_by: admin
      },

      {
        user_id: User.find_by(email: dummy_applicants_list[3][:email]).id,
        confidence: 4,
        skill_proficiency: 4,
        experience: 3,
        vetted_by: admin
      },

      {
        user_id: User.find_by(email: dummy_applicants_list[4][:email]).id,
        confidence: 5,
        skill_proficiency: 5,
        experience: 4,
        vetted_by: admin
      }
    ]
    User.all.select(&:accepted?).each do |accepted_user|
      vetting_record = {
        user_id: accepted_user.id,
        confidence: 1,
        skill_proficiency: 5,
        experience: 4,
        vetted_by: admin
      }
      vetting_records.push(vetting_record)
    end
    vetting_records
  end

  def create_all
    dummy_applicants_list.each { |applicant| User.create(applicant) }
    vetting_records_list.each do |vetting_record|
      VettingRecord.create(vetting_record)
    end
  end
end
DummyData.new.create_all
