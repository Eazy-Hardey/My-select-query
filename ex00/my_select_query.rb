require 'csv'
class MySelectQuery
    def initialize(content)
        @data = CSV.parse(content, headers: true)
        #p @data
    end

    def where(column_name, criteria)
        result = []
        @data.filter do |row|
            if row[column_name] == criteria
                result << row.to_hash.values.join(',')
            end
        end
        result
    end
end

=begin
def _main()
  content = "name,year_start,year_end,position,height,weight,birth_date,college\nAlaa Abdelnaby,1991,1995,F-C,6-10,240,'June 24, 1968',Duke University\nZaid Abdul-Aziz,1969,1978,C-F,6-9,235,'April 7, 1946',Iowa State University\nKareem Abdul-Jabbar,1970,1989,C,7-2,225,'April 16, 1947','University of California, Los Angeles
  Mahmoud Abdul-Rauf,1991,2001,G,6-1,162,'March 9, 1969',Louisiana State University\n"

  instance = MySelectQuery.new(content)
  p instance.where("name", "Andre Brown")
end

_main()
=end