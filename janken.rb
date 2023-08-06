class Janken
  def initialize(my_hand,janken_round)
    @my_hand = my_hand
    @janken_round = janken_round
  end
  
  def error_check(get_number)
    if get_number > 3
      puts"選択肢エラーです"
    end
  end
  
  def hand_type(my_hand,cpu_hand)
    @my_hand = my_hand
    @cpu_hand = cpu_hand
    jankens = ["グー","チョキ","パー","戦わない"]
    puts "あなた:#{jankens[@my_hand]}を選択しました"
    puts "相手:#{jankens[@cpu_hand]}を選択しました"
  end 

  def janken_voice
    if @janken_round == 1
      puts "じゃんけん..."
    elsif @janken_round > 1 
      puts "あいこで..."
    end
  end

  def janken_second_voice
    if @janken_round == 1
      puts "ほい！"
    elsif @janken_round > 1 
      puts "しょ！"
    end
  end

  def janken_judgement
    if @my_hand == @cpu_hand
      @janken_round += 1
      return true
    elsif (@my_hand == 0 && @cpu_hand == 1)||(@my_hand == 1 && @cpu_hand == 2)||(@my_hand == 2 && @cpu_hand == 0)
      #"あなたの勝ちです"
      @janken_round = 1
      return false
    elsif @my_hand == 3
      #"あなたの負けです"
      @janken_round = 1
      return false
    else
      #"あなたの負けです"
      @janken_round = 1
      return false
    end
  end
end

class Look_there
  def initialize(my_hand,cpu_hand)
    @my_hand = my_hand
    @cpu_hand = cpu_hand
  end
  
  def attack_defence(my_hand,cpu_hand)
    @my_hand = my_hand
    @cpu_hand = cpu_hand
    if (@my_hand == 0 && @cpu_hand == 1)||(@my_hand == 1 && @cpu_hand == 2)||(@my_hand == 2 && @cpu_hand == 0)
      puts "あなたが攻めです"
    else
      puts "あなたが受けです"
    end
  end
  
  def two_way(my_way,cpu_way)
    @my_way = my_way
    @cpu_way = cpu_way
    ways = ["上","下","左","右"]
    puts "あなた:#{ways[@my_way]}"
    puts "相手:#{ways[@cpu_way]}"
  end
  
  def error_check(get_number)
    if get_number > 3
      puts"選択肢エラーです"
    end
  end
  
  def look_there_judgement
    if @my_way == @cpu_way
      #"勝負がついた"
      return false
    else
      #"引き分け"
      return true
    end
  end

  def all_judgement
    if ((@my_hand == 0 && @cpu_hand == 1)||(@my_hand == 1 && @cpu_hand == 2)||(@my_hand == 2 && @cpu_hand == 0)) && @my_way == @cpu_way
      puts "YOU WIN!"
    elsif ((@my_hand == 1 && @cpu_hand == 0)||(@my_hand == 2 && @cpu_hand == 1)||(@my_hand == 0 && @cpu_hand == 2)) && @my_way == @cpu_way
      puts "YOUR LOSS!"
    end
  end
end

janken = Janken.new(0,1)

next_game = true

while next_game
  puts "_________________________________________________"
  puts "じゃんけんをします"
  puts "選択肢　[ 0(グー) 1(チョキ) 2(パー) 3(戦わない) ]"
  my_hand = gets.to_i 
  cpu_hand = rand(3)
  janken.error_check(my_hand)
  if my_hand > 3
    break
  end
  janken.janken_voice
  janken.janken_second_voice
  janken.hand_type(my_hand,cpu_hand)
  next_game = janken.janken_judgement
  puts "_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _"
  if next_game == false #勝ちor負けであっち向いてほい
    puts "あっち向いてほいをします"
    look_there = Look_there.new(0,0)
    look_there.attack_defence(my_hand,cpu_hand)
    puts "選択肢　[ 0(上) 1(下) 2(左) 3(右) ]"
    my_way = gets.to_i
    cpu_way = rand(3)
    look_there.error_check(my_way)
    if my_way > 3
      break
    end
    puts "あっち向いて~"
    puts "ほい！"
    look_there.two_way(my_way,cpu_way)
    look_there.all_judgement
    puts "_________________________________________________"
    next_game = look_there.look_there_judgement
  end
end