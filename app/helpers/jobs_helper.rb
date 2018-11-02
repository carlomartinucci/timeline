module JobsHelper
  def job_name_and_dates job
    return nil if job.nil?

    [job.name, job_dates(job)].compact.join(' ')
  end

  def job_dates job
    return nil if job.nil?

    if job.started_at.present? && job.ended_at.present?
      "(#{l job.started_at, format: :short} - #{l job.ended_at, format: :short})"
    elsif job.started_at.present?
      "(#{l job.started_at, format: :short} - current)"
    elsif job.ended_at.present?
      "(? - #{l job.ended_at, format: :short})"
    end
  end
end
