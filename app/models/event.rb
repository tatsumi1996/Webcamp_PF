class Event < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_end_check

  def start_end_check
    errors.add(:end_date, "は開始時刻より遅い時間を選択してください") if self.start_date > self.end_date
  end

end
