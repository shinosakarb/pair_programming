class Hero
  def action_list
    [[1, 'たたかう'],[2, 'にげる']]
  end

  def action(id)
    if action_list.none?{|item| item[0] == id }
      return ''
    end

    if id == 1
      '攻撃した'
    else
      nil
    end
  end
end
