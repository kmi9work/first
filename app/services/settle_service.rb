class SettleService
  attr_accessor  :id, :name, :category
  def self.all 
    f = File.open("db/my_db/settle.csv", "r")
    str = f.gets.strip
    settles = []
    while (str.present?)
      settle = SettleService.new
      settle.id = str.split(";")[0]
      settle.name = str.split(";")[1]
      settle.category = str.split(";")[2]
      settles.push(settle)
      str = f.gets
    end
    
    f.close
    settles
 end

  def self.create(name, category)
    #с помощью костыля
    f_max_id = File.open("db/my_db/settle_max_id.csv", "r")
    new_id = f_max_id.gets.to_i + 1
    f_max_id.close

    f_settle = File.open("db/my_db/settle.csv", "a+") #пишет в конец, а также создает новый файл.
    str = "#{new_id};#{name}; #{category}" #добавляет переменную внутрь строки
    f_settle.puts str
    f_settle.close

    f_max_id = File.open("db/my_db/settle_max_id.csv", "w")
    f_max_id.puts new_id
    f_max_id.close
  end
end
