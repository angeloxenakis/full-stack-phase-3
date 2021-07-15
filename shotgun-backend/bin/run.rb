require_relative '../config/environment'

prompt = TTY::Prompt.new
current_user = nil

menu_choice = prompt.select('What would you like to do?', ["Login", "Signup"])

if menu_choice === "Login"
    user_name = prompt.ask("Username:")
    password = prompt.mask("Password:")

    current_user = Patient.all.find { |pat| pat.name === user_name && pat.password === password }

    puts "Hello #{current_user.name}!!!!"

    doctor_choice = prompt.select("Select a doctor below:", Doctor.all)
    date_choice = prompt.select("Choose a date", [Date.parse("10/10/2010"), Date.parse("10/11/2010"), Date.parse("10/12/2010")])

    appt_confirmation = prompt.select("Are you sure you want to book an appt with #{doctor_choice.name} at #{date_choice}?", ["Yes", "No"])

    if appt_confirmation === "Yes"
        Appointment.create(doctor_id: doctor_choice.id, patient_id: current_user.id, date: date_choice)

        puts "Your appoitment has been booked!"
    end

end
