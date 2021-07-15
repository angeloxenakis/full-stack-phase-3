Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all

d1 = Doctor.create(name: "Dr. Doc", speciality: "knees")
d2 = Doctor.create(name: "Dr. Yes", speciality: "necks")

p1 = Patient.create(name: "Steve", password: "123")
p2 = Patient.create(name: "Jan", password: "123")
p3 = Patient.create(name: "Tim", password: "123")
p4 = Patient.create(name: "Pam", password: "123")

Appointment.create(doctor_id: Doctor.first.id, patient_id: Patient.first.id, date: 2021-06-13)
