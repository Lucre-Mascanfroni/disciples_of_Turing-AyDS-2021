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

