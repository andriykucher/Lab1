require 'csv'
require 'json'

class Cart
  def save_to_json(file_path, data)
    File.open(file_path,"w") do |file|
      file.write(data.map{|item| item.to_hash}.to_json)
    end
  end

  def save_to_cvs(file_path, data)
    CSV.open(file_path, "w", write_headers: false) do |csv|
      data.each{ |item|
        csv << item.to_hash.values
      }
    end
  end
end
