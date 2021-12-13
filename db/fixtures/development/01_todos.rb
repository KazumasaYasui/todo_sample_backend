1.upto(10) do |i|
  Todo.seed_once(:id,
                 {
                   id: i,
                   title: Faker::Team.name,
                   body: Faker::Team.mascot,
                   status: 0
                 })
end
