#Clean DataSet
Outcome.all.map { |o| o.destroy }
Response.all.map { |r| r.destroy }
Choice.all.map { |c| c.destroy }
Question.all.map { |q| q.destroy }
Survey.all.map { |c| c.destroy }
Career.all.map { |s| s.destroy }

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

q1 = Question.create(name: '1. ', description: 'Me trasladaría a una zona agrícola-ganadera para ejercer mi profesión.', number: 1, type: 'exclusive')
	ch1_q1 = Choice.create(text: '1. Si', question: q1)
		Outcome.create(choice: ch1_q1, career: veterinaria)
		Outcome.create(choice: ch1_q1, career: agronomia)
	ch2_q1 = Choice.create(text: '2. No', question: q1) 

q2 = Question.create(name: '2. ', description: 'Tengo buena memoria y no me cuesta estudiar y retener fórmulas y palabras técnicas.', number: 2, type: 'exclusive')
	ch1_q2 = Choice.create(text: '1. Si', question: q2)
		Outcome.create(choice: ch1_q2, career: fisica)
		Outcome.create(choice: ch1_q2, career: matematicas)
		Outcome.create(choice: ch1_q2, career: quimica)
		Outcome.create(choice: ch1_q2, career: computacion)
	ch2_q2 = Choice.create(text: '2. No', question: q2) 	

q3 = Question.create(name: '3. ', description: 'Me gusta escribir. En general mis trabajos son largos y están bien organizados.', number: 3, type: 'exclusive')
	ch1_q3 = Choice.create(text: '1. Si', question: q3)
		Outcome.create(choice: ch1_q3, career: literatura)
		Outcome.create(choice: ch1_q3, career: historia)
	ch2_q3 = Choice.create(text: '2. No', question: q3) 

q4 = Question.create(name: '4. ', description: 'Sé quien es Steven Hawking: Conozco y me atraen sus descubrimientos.', number: 4, type: 'exclusive')
	ch1_q4 = Choice.create(text: '1. Si', question: q4)
		Outcome.create(choice: ch1_q4, career: fisica)
	ch2_q4 = Choice.create(text: '2. No', question: q4)

q5 = Question.create(name: '5. ', description: 'Me actualizo respecto de los avances tecnológicos y me intereso por investigar y conocer.', number: 5, type: 'exclusive')
	ch1_q5 = Choice.create(text: '1. Si', question: q5)
		Outcome.create(choice: ch1_q5, career: computacion)
	ch2_q5 = Choice.create(text: '2. No', question: q5)

q6 = Question.create(name: '6. ', description: 'Sé quien es Andy Warhol y a qué movimiento artístico pertenece. Me apasiona conocer acerca del arte y sus exponentes.', number: 6, type: 'exclusive')
	ch1_q6 = Choice.create(text: '1. Si', question: q6)
		Outcome.create(choice: ch1_q6, career: arte)
	ch2_q6 = Choice.create(text: '2. No', question: q6)

q7 = Question.create(name: '7. ', description: 'En general me intereso por las dificultades que ha tenido que atravesar la humanidad y cómo lo ha superado.', number: 7, type: 'exclusive')
	ch1_q7 = Choice.create(text: '1. Si', question: q7)
		Outcome.create(choice: ch1_q7, career: historia)
	ch2_q7 = Choice.create(text: '2. No', question: q7)

q8 = Question.create(name: '8. ', description: 'Me apasiona leer y no me importa si el libro que elijo tiene muchas páginas, para mí es un gran entretenimiento.', number: 8, type: 'exclusive')
	ch1_q8 = Choice.create(text: '1. Si', question: q8)
		Outcome.create(choice: ch1_q8, career: literatura)
		Outcome.create(choice: ch1_q8, career: historia)
	ch2_q8 = Choice.create(text: '2. No', question: q8) 

q9 = Question.create(name: '9. ', description: 'Me atrae conocer los procesos y las áreas que hacen funcionar a las empresas.', number: 9, type: 'exclusive')
	ch1_q9 = Choice.create(text: '1. Si', question: q9)
		Outcome.create(choice: ch1_q9, career: economia)
	ch2_q9 = Choice.create(text: '2. No', question: q9)

q10 = Question.create(name: '10. ', description: 'Me siento identificado con el pensamiento de algunos filósofos y escritores.', number: 10, type: 'exclusive')
	ch1_q10 = Choice.create(text: '1. Si', question: q10)
		Outcome.create(choice: ch1_q10, career: filosofia)
		Outcome.create(choice: ch1_q10, career: historia)
	ch2_q10 = Choice.create(text: '2. No', question: q10) 

q11 = Question.create(name: '11. ', description: 'Me encanta estudiar el cuerpo humano y conocer cómo funciona. Además, no me impresiona la sangre.', number: 11, type: 'exclusive')
	ch1_q11 = Choice.create(text: '1. Si', question: q11)
		Outcome.create(choice: ch1_q11, career: medicina)
	ch2_q11 = Choice.create(text: '1. No', question: q11)

q12 = Question.create(name: '12. ', description: 'Si pudiera elegir, pasaría mucho tiempo diseñando novedosos objetos o edificios en mi computadora.', number: 12, type: 'exclusive')
	ch1_q12 = Choice.create(text: '1. Si', question: q12)
		Outcome.create(choice: ch1_q12, career: computacion)
		Outcome.create(choice: ch1_q12, career: arquitectura)
	ch2_q12 = Choice.create(text: '2. No', question: q12) 

q13 = Question.create(name: '13. ', description: 'Si mi blog fuera temático, trataría acerca de: ', number: 13, type: 'exclusive')
	ch1_q13 = Choice.create(text: '1. La importancia de la expresión artística en el desarrollo de la identidad de los pueblos.', question: q13)
		Outcome.create(choice: ch1_q13, career: sociologia)
	ch2_q13 = Choice.create(text: '2. La arquelogía urbana como forma de aprender acerca de la historia cultural de una ciudad.', question: q13)
		Outcome.create(choice: ch2_q13, career: historia)
	ch3_q13 = Choice.create(text: '3. La tecnología satelital en un proyecto para descubrir actividad volcánica para prevenir catástrofes climáticas.', question: q13) 
		Outcome.create(choice: ch3_q13, career: computacion)
		Outcome.create(choice: ch3_q13, career: geologia)
	ch4_q13 = Choice.create(text: '4. Ninguna de las opciones.', question: q13)

q14 = Question.create(name: '14. ', description: 'Integraría un equipo de trabajo encargado de producir un audiovisual sobre: ', number: 14, type: 'exclusive')
	ch1_q14 = Choice.create(text: '1. La práctica de deportes y su influencia positiva en el estado de ánimo de las personas.', question: q14)
		Outcome.create(choice: ch1_q14, career: educFisica)
	ch2_q14 = Choice.create(text: '2. Los pensadores del siglo XX y su aporte a la gestión de las organizaciones.', question: q14)
		Outcome.create(choice: ch2_q14, career: filosofia)
		Outcome.create(choice: ch2_q14, career: historia)
	ch3_q14 = Choice.create(text: '3. Las mascotas y su incidencia en la calidad de vida de las personas no videntes.', question: q14) 
		Outcome.create(choice: ch3_q14, career: veterinaria)
	ch4_q14 = Choice.create(text: '4. El uso de la PC como herramienta para el control de los procesos industriales.', question: q14)
		Outcome.create(choice: ch4_q14, career: computacion)
	ch5_q14 = Choice.create(text: '5. Procesos productivos de una empresa', question: q14)
		Outcome.create(choice: ch5_q14, career: economia)
  	ch6_q14 = Choice.create(text: '6. Ninguna de las opciones.', question: q14)
  
q15 = Question.create(name: '15. ', description: 'Sería importante destacarme como: ', number: 15, type: 'exclusive')
	ch1_q15 = Choice.create(text: '1. Director de una investigación técnico científica', question: q15)
		Outcome.create(choice: ch1_q15, career: fisica)
		Outcome.create(choice: ch1_q15, career: quimica)
		Outcome.create(choice: ch1_q15, career: computacion)
	ch2_q15 = Choice.create(text: '2. Gerente general de una empresa reconocida por su responsabilidad social.', question: q15)
		Outcome.create(choice: ch2_q15, career: economia)
	ch3_q15 = Choice.create(text: '3. Un deportista famoso por su destreza física y su ética profesional.', question: q15) 
		Outcome.create(choice: ch3_q15, career: educFisica)
	ch4_q15 = Choice.create(text: '4. Experto en la detección precoz de enfermedades neurológicas en niños.', question: q15)
		Outcome.create(choice: ch4_q15, career: medicina)
	ch5_q15 = Choice.create(text: '5. Un agente de prensa audaz, número uno en el ranking de notas a celebridades.', question: q15)
		Outcome.create(choice: ch5_q15, career: periodismo)
  	ch6_q15 = Choice.create(text: '6. Ninguna de las opciones.', question: q15)
