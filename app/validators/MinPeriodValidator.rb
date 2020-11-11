class MinPeriodValidator < ActiveModel::Validator
  def validate(record)
    if record.end_time && record.start_time && (record.end_time - record.start_time) / 60 < 60
      record.errors.add :period, "Must be minimum one hour."
    end
  end
end
