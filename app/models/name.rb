class Name < ActiveRecord::Base

	has_many :birth_years
	has_many :districts

	attr_accessible :name_type, :name, :count

  TYPE = {:first_name => 1, :last_name => 2}

	def self.by_first_name(first_name)
		if first_name
			x = where(:name_type => Name::TYPE[:first_name], :name => first_name)
			return x.first if x && !x.empty?
		end
	end

	def self.by_last_name(last_name)
		if last_name
			x = where(:name_type => Name::TYPE[:last_name], :name => last_name)
			return x.first if x && !x.empty?
		end
	end

  def self.top_first_names(limit=10)
    where(:name_type => Name::TYPE[:first_name]).order("count desc").limit(limit)
  end

  def self.top_last_names(limit=10)
    where(:name_type => Name::TYPE[:last_name]).order("count desc").limit(limit)
  end

	def by_years
		birth_years.map{|x| {:birth_year => x.birth_year, :count => x.count, :rank => x.rank}}
	end

	def by_districts
		districts.map{|x| {:district_id => x.district_id, :count => x.count, :rank => x.rank}}
	end
	

end
