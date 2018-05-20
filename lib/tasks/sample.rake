namespace :sample do
  desc 'Adds all sample data to database'
  task all: [:users, :invests]

  desc 'Adds sample users to database'
  task users: :environment do
    User.create(email: 'karmajill@test.com',
                username: 'karmajill',
                password: '123123123')
    User.create(email: 'shambalaman@test.com',
                username: 'shambalaman',
                password: '123123123')
    User.create(email: 'jeffo@test.com',
                username: 'jeffo',
                password: '123123123')
    User.create(email: 'dhhomie@test.com',
                username: 'dhhomie',
                password: '123123123')
    User.create(email: 'darlineycode@test.com',
                username: 'darlineycode',
                password: '123123123')
  end

  desc 'Creates sample invests'
  task invests: :environment do
    Invest.create(title: 'Htcht - Automation CLI',
                  body: 'Full stack web developer who excels in programming and designing modern web/mobile applications. With experience in design and imple- mentation of REST APIs, building service based applications, code design/architecture and front-end design/development.
     e majority of my work is in Ruby and JavaScript using Ruby on Rails, BackboneJS and AngularJS. Work responsibilities include develop- ment, code design, versioning, code review, deployment and team lead/project management.
     I love learning new languages and frameworks in my o -time. I  nd the best part of life is being creative and solving problems. I also enjoy working on teams, have managed o -shore employees, am very organized, a fast learner and have experience as a team lead on multiple projects.',
                  user: User.all[0])
    Invest.create(title: 'Swift Auto-Layout',
                  body: 'Full stack web developer who excels in programming and designing modern web/mobile applications. With experience in design and imple- mentation of REST APIs, building service based applications, code design/architecture and front-end design/development.
     e majority of my work is in Ruby and JavaScript using Ruby on Rails, BackboneJS and AngularJS. Work responsibilities include develop- ment, code design, versioning, code review, deployment and team lead/project management.
     I love learning new languages and frameworks in my o -time. I  nd the best part of life is being creative and solving problems. I also enjoy working on teams, have managed o -shore employees, am very organized, a fast learner and have experience as a team lead on multiple projects.',
                  user: User.all[1])
    Invest.create(title: 'My Investment Time',
                  body: 'Full stack web developer who excels in programming and designing modern web/mobile applications. With experience in design and imple- mentation of REST APIs, building service based applications, code design/architecture and front-end design/development.
     e majority of my work is in Ruby and JavaScript using Ruby on Rails, BackboneJS and AngularJS. Work responsibilities include develop- ment, code design, versioning, code review, deployment and team lead/project management.
     I love learning new languages and frameworks in my o -time. I  nd the best part of life is being creative and solving problems. I also enjoy working on teams, have managed o -shore employees, am very organized, a fast learner and have experience as a team lead on multiple projects.',
                  user: User.all[2])
    Invest.create(title: 'Company Best Practices',
                  body: 'Full stack web developer who excels in programming and designing modern web/mobile applications. With experience in design and imple- mentation of REST APIs, building service based applications, code design/architecture and front-end design/development.
     e majority of my work is in Ruby and JavaScript using Ruby on Rails, BackboneJS and AngularJS. Work responsibilities include develop- ment, code design, versioning, code review, deployment and team lead/project management.
     I love learning new languages and frameworks in my o -time. I  nd the best part of life is being creative and solving problems. I also enjoy working on teams, have managed o -shore employees, am very organized, a fast learner and have experience as a team lead on multiple projects.',
                  user: User.all[3])
    Invest.create(title: 'Time Tracking API',
                  body: 'Full stack web developer who excels in programming and designing modern web/mobile applications. With experience in design and imple- mentation of REST APIs, building service based applications, code design/architecture and front-end design/development.
     e majority of my work is in Ruby and JavaScript using Ruby on Rails, BackboneJS and AngularJS. Work responsibilities include develop- ment, code design, versioning, code review, deployment and team lead/project management.
     I love learning new languages and frameworks in my o -time. I  nd the best part of life is being creative and solving problems. I also enjoy working on teams, have managed o -shore employees, am very organized, a fast learner and have experience as a team lead on multiple projects.',
                  user: User.all[4])
  end
end