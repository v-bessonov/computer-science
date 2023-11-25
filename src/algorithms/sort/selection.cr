module Computer::Science::Sort
  class Selection < AbstractSort
    def self.run
      self.getFile
      lines = File.read_lines("#{Dir.current}/src/files/sort/#{@@fileName}")

      list = self.getLines(lines)
      sort(list)
    end

    private def self.sort(arr : Array(String))
      pp arr
      length = arr.size
      i = 0
      while i < length
        min = i
        j = i + 1
        while j < length
          if self.less(arr[j], arr[min])
            min = j
          end
          j += 1
        end
        exch(arr, i, min)
        i += 1
      end

      puts "sorted"
      pp arr
    end
  end
end
