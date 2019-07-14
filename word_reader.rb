# encoding: UTF-8

class WordReader
  def read_from_args
    ARGV[0]
  end

  def read_from_file(file_name)
    if !File.exist?(file_name)
      return nil
    end
    file = File.new(file_name, "r:UTF-8")
    lines = file.readlines
    file.close

    lines.sample.chomp
  end
end
