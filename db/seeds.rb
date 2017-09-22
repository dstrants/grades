require 'yaml'

@thing = YAML.load_file('config/lessons.yml')
@thing['lessons'].each do |les|
  Lesson.create!(name: les['name'], code: les['code'], ects: les['ects'],
                 semester: les['semester'], ltype: les['type'])
end
