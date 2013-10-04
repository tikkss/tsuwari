class InsertTastes < ActiveRecord::Migration
  def up
    %w(甘い 辛い 酸っぱい あっさり こってり).each do |name|
      Taste.create(name: name)
    end
  end

  def down
    Taste.delete_all
  end
end
