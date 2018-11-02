module PeopleHelper
  def person_name_and_dates person
    return nil if person.nil?

    [person.name, person_dates(person)].compact.join(' ')
  end

  def person_dates person
    return nil if person.nil?

    if person.born_at.present? && person.dead_at.present?
      "(#{l person.born_at, format: :short} - #{l person.dead_at, format: :short})"
    elsif person.born_at.present?
      "(#{l person.born_at, format: :short}, #{time_ago_in_words person.born_at})"
    elsif person.dead_at.present?
      "(? - #{l person.dead_at, format: :short})"
    end
  end
end
