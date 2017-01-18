class User < ApplicationRecord
  has_many :tasks

  def self.rebalance
    tasks = Task.all
    users = User.all

    tasks.map{|t| t.user_id = nil}
    tasks.map{|t| t.save}

    divideEqualSum(tasks, users)
  end

  def self.divideEqualSum(tasks, users)
    # reverse sort array of tasks
    tasks.sort_by(&:story_points).reverse
    result = []
    # make array of arrays equal users count
    users.size.times{|i| result[i] = []}
    tasks.each do |task|
      result.each.with_index do |val, index|
        # find index of array with min sum
        index_with_min_sum = result.each_index.min_by {|a| result[a].sum(&:story_points)}
        # add task to array with min sum
        result[index_with_min_sum] <<  task  unless result.map{|a| a.include?(task)}.uniq[0] ||
                                                   result.map{|a| a.include?(task)}.uniq[1]

      end
    end
    # Assign balanced tasks to users
    users.each_with_index do |user, i|
      user.tasks = result[i]
    end
    return users
  end

  def self.clear
    tasks = Task.all

    tasks.map{|t| t.user_id = nil}
    tasks.map{|t| t.save}

    User.all
  end
end
