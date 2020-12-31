module WeightHistoriesHelper
  def weight_comment(weight)
    if weight < 20
      "#{weight} (痩せ型)"
    end
  end
end
