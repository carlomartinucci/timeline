module ClaimsHelper
  def claim_title_and_dates claim
    return nil if claim.nil?

    [claim.title, claim_dates(claim)].compact.join(' ')
  end

  def claim_dates claim
    return nil if claim.nil?

    if claim.happened_at.present? && claim.claimed_at.present?
      "(Happened: #{l claim.happened_at, format: :short}; claimed: #{l claim.claimed_at, format: :short})"
    elsif claim.happened_at.present?
      "(Happened: #{l claim.happened_at, format: :short})"
    elsif claim.claimed_at.present?
      "(Claimed: #{l claim.claimed_at, format: :short})"
    end
  end
end
