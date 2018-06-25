class AddPointsJob < ApplicationJob
  queue_as :default

  def perform
    User.find_each do |user|
      new_score = (user.predictions.where(correct: true).count * 3)
      user.score = new_score
      user.save
    end
  end
end
