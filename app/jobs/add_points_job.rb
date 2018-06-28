class AddPointsJob < ApplicationJob
  queue_as :default

  def perform
    User.find_each do |user|
      new_score = (user.predictions.where(correct: true).count * 3)
      user.score = new_score
      knockout_score = (user.predictions.where(correct: true).where.not(round: Round.first).count * 3)
      user.score_sixteen = knockout_score
      user.save
    end
  end
end
