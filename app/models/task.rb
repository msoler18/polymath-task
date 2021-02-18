# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  due_date    :date
#  category_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  owner_id    :bigint           not null
#
class Task < ApplicationRecord
  belongs_to :category
  belongs_to :owner, class_name: 'User'
  has_many :participating_users, class_name: 'Participant'
  has_many :participants, through: :participating_users, source: :user
  has_many :notes

  validates :participating_users, presence: true

  validates :name, :description, presence: true
  validate :due_date_validity

  # after_create :send_email

  accepts_nested_attributes_for :participating_users, allow_destroy: true

  def due_date_validity
    return if due_date.blank?
    return if due_date > Date.today
    errors.add :due_date, '- Invalid due date for polymath task -'
  end 

  def self.search(search)
    key = "%#{search}%"
    if search
     where('description LIKE ?', key)
    else
      all
    end
  end

  # def send_email
  #   (participants + [owner]).each do |user|
  #     ParticipantMailer.with(user: user, task: self).new_task_email.deliver!
  #   end
  # end

end
