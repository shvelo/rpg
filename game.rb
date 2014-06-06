class Room
  attr_accessor :npcs
  attr_accessor :items
  attr_accessor :name
  attr_accessor :enemies

  def initialize name, items = [], npcs = [], enemies = []
    @name = name
    @items = items
    @npcs = npcs
    @enemies = enemies
  end
end

class Item
  attr_accessor :name
  attr_accessor :info

  def initialize name, info = ""
    @name = name
    @info = info
  end
end

class NPC
  attr_accessor :name
  attr_accessor :info

  def initialize name, info = ""
    @name = name
    @info = info
  end
end

module Combat
  def attack opponent
    damage = @stats[:attack] + (@stats[:attack] - opponent.stats[:defense]) * 5
    damage = damage * (5 + (rand 5))
    opponent.hp -= damage
    return damage
  end
end

class Enemy
  include Combat
  attr_accessor :name
  attr_accessor :info
  attr_accessor :stats
  attr_accessor :hp
  attr_accessor :items

  def initialize name, info = "", items = [], stats = { :attack => 1, :defense => 1 }, hp = 100
    @name = name
    @info = info
    @hp = hp
    @stats = stats
    @items = items
  end
end

class Player
  include Combat
  attr_accessor :stats
  attr_accessor :hp
  attr_accessor :items

  def initialize stats = { :attack => 1, :defense => 1 }, hp = 100, items = []
    @hp = hp
    @stats = stats
    @items = items
  end
end