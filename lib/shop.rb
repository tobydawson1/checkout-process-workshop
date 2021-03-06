class Shop
  def self.checkout(items)
    arr = items.split("")
    total = 0

    arr.each { |item|
      if item.match(/[^ABCD]/)
        return -1
      end
    }

    if arr.count("B") > 1 
      if arr.count("B").odd?
        total = total + ((arr.count("B") / 2) * 45) + 30
      elsif arr.count("B").even?
        total = total + ((arr.count("B") / 2) * 45)
      end
      arr.delete_if { |item| 
      item == "B"  
      }
    end

    if arr.count("A") > 2 
      if arr.count("A").even?
        total = total + ((arr.count("A") / 3) * 130) + ((arr.count("A") % 3) * 50)
      elsif arr.count("A").odd?
        total = total + ((arr.count("A") / 3) * 130) + ((arr.count("A") % 3) * 50)
      end
      arr.delete_if { |item| 
      item == "A"  
      }
    end
    
    arr.each {|item|
    if item == 'A'
      total += 50
    elsif item == 'B'
      total += 30
    elsif item == 'C'
      total += 20
    elsif item == 'D'
      total += 15
    end
    }
    return total
  end
end