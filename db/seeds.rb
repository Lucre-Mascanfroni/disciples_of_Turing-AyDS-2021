#Clean DataSet
Career.all.map { |s| s.destroy  }
Survey.all.map { |c| c.destroy  }

#Create career
agronomia = Career.create(name: 'Agronomia')
arquitectura = Career.create(name: 'Arquitectura')
arte = Career.create(name: 'Arte')
computacion = Career.create(name: 'Computación')
economia = Career.create(name: 'Economía')
educFisica = Career.create(name: 'Educación Física')
filosofia = Career.create(name:'Filosofía')
fisica = Career.create(name: 'Física')
geologia = Career.create(name: 'Geología')
historia = Career.create(name: 'Historia')
literatura = Career.create(name: 'Literatura')
matematicas = Career.create(name: 'Matemáticas')
medicina = Career.create(name: 'Medicina')
periodismo = Career.create(name: 'Periodismo')
quimica = Career.create(name: 'Química')
sociologia = Career.create(name: 'Sociología')
veterinaria = Career.create(name: 'Veterinaria')

q1 = Question.new(name: '1. ', description:'Me trasladaría a una zona agrícola-ganadera para ejercer mi profesión.')
q1.save
	ch1_q1 = Choice.new(text:'1. Si', question:q1)
		Outcome.create(choice: ch1_q1, career: veterinaria)
		Outcome.create(choice: ch1_q1, career: agronomia)
	ch2_q1 = Choice.new(text:'2. No', question:q1) 

q2 = Question.new(name:'2. ', description:'Tengo buena memoria y no me cuesta estudiar y retener fórmulas y palabras técnicas.')
q2.save
	ch1_q2 = Choice.new(text:'1. Si', question:q2)
		Outcome.create(choice: ch1_q2, career: fisica)
		Outcome.create(choice: ch1_q2, career: matematicas)
		Outcome.create(choice: ch1_q2, career: quimica)
		Outcome.create(choice: ch1_q2, career: computacion)
	ch2_q2 = Choice.new(text:'2. No', question:q2) 	

q3 = Question.new(name:'3. ', description:'Me gusta escribir. En general mis trabajos son largos y están bien organizados.')
q3.save
	ch1_q3 = Choice.new(text:'1. Si', question:q3)
		Outcome.create(choice: ch1_q3, career: literatura)
		Outcome.create(choice: ch1_q3, career: historia)
	ch2_q3 = Choice.new(text:'2. No', question:q3) 

q4 = Question.new(text:'4. ', description:'Sé quien es Steven Hawking: Conozco y me atraen sus descubrimientos.')
q4.save
	ch1_q4 = Choice.new(text:'1. Si', question:q4)
		Outcome.create(choice: ch1_q4, career: fisica)
	ch2_q4 = Choice.new(text:'2. No', question:q4)

