class WeightHistory < ApplicationRecord
  belongs_to :user

  # デフォルトで準備されているバリデーション（presence, length...）
  validates :user_id, presence: {message: 'ユーザーを入力してください'}
  validates :memo, length: {maximum: 255, too_long: 'メモは最大%{count}文字以内で入力してください'}

  # カスタムバリデーション
  validate :weight_validate
  def weight_validate
    if weight < 1
      errors.add(:weight, '体重が正しくありません')
    end
  end
end
