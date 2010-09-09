module BlogsHelper

  def week_en(num)
    case(num)
    when 0: return 'Sunday'
    when 1: return 'Monday'
    when 2: return 'Tuesday'
    when 3: return 'Wednesday'
    when 4: return 'Thursday'
    when 5: return 'Friday'
    when 6: return 'Saturday'
    else return 'Sunday'
    end
  end

end
