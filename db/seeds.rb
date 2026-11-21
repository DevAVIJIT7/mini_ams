Member.destroy_all
Event.destroy_all
CreditType.destroy_all

member1 = Member.create!(
  first_name: "Avijit",
  last_name: "Majhi",
  email: "member1@example.com",
  password: "Password@123",
  member_type: "learner",
  tenant_id: "tenant_1"
)

Member.create!(
  first_name: "Soma",
  last_name: "Majhi",
  email: "member2@example.com",
  password: "Password@123",
  member_type: "instructor",
  tenant_id: "tenant_1"
)

events = 3.times.map do |i|
  Event.create!(
    title: "Mini AMS Event #{i + 1}",
    description: "Sample event #{i + 1}",
    starts_at: (i + 1).days.from_now,
    ends_at: (i + 1).days.from_now + 2.hours,
    tenant_id: "tenant_1"
  )
end

Registration.create!(
  member: member1,
  event: events[0],
  status: "registered"
)

Registration.create!(
  member: member1,
  event: events[1],
  status: "registered"
)

CreditType.create!(
  code: "CEU",
  name: "Continuing Education Unit"
)

CreditType.create!(
  code: "CPE",
  name: "Continuing Professional Education"
)

puts "Mini AMS seed data created successfully"