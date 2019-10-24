# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  caption        :string
#  comments_count :integer
#  image          :string
#  likes_count    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#

class Photo < ApplicationRecord
    def poster
        return User.where({:id => self.owner_id}).at(0)
    end
    def comments
        return Comment.where({:photo_id => self.id})
    end
    def likes
        return Like.where({:photo_id => self.id})
    end
    def fans
        y =  Like.where({:photo_id => self.id}).pluck(:fan_id)
        return User.where({:id => y})
    end
    def fan_list
        y =  Like.where({:photo_id => self.id}).pluck(:fan_id)
        users = User.where({:id => y}).pluck(:username)
        list = String.new
        p numberusers = users.count
        return numberusers
        numberusers.times do |times|
            p list = list + users(times)
        end
        return list
    end
end
