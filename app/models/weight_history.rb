class WeightHistory < ApplicationRecord
  belongs_to :user

  # 処理の流れ
  # create or update or save
  # validation
  # SQL実行

  # Active Record Callback
  before_validation :set_memo

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

  def set_memo
    if memo.nil? || memo == ''
      self.memo = "なし" # 代入の時は'self.'が必要
    end
  end
end
