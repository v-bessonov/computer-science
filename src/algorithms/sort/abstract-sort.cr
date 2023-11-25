module Computer::Science::Sort
  abstract class AbstractSort
    @@fileName : String | Nil

    protected def self.less(v : Comparable, w : Comparable) : Bool
      v < w
    end

    protected def self.exch(arr : Array(Comparable), i : Int32, j : Int32)
      swap = arr[i]
      arr[i] = arr[j]
      arr[j] = swap
    end

    protected def self.getLines(lines : Array(String)) : Array(String)
     list = Array(String).new
      if !lines.nil? && lines.size > 0
        lines.each do |item|
          splitted = item.split(/\s+/m, remove_empty: true)
          splitted.each do |i|
            list.push(i)
          end
        end
      end
      list
    end

    protected def self.getFile()
      puts "Choose file:"
      puts "1 - tiny.txt"
      puts "2 - words3.txt"
      puts "q - quit"
      print "> "
      input = gets
      @@fileName = nil
      case input
      when "1"
        @@fileName = "tiny.txt"
      when "2"
        @@fileName = "words3.txt"
      when "q"
        exit
      else
        exit
      end
    end
  end
end
