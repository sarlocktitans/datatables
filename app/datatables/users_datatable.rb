class UsersDatatable < ApplicationDatatable

  private

	def data
		users.map do |user|
			[].tap do |column|
				column << user.first_name
				column << user.last_name
				column << user.phone_number
			end
		end
	end

	def count 
		User.count
	end

	def total_entries
		users.total_entries
	end

	def users
		@users ||= fetch_users
	end

	def fetch_users
		search_string = []
		columns.each do |term|
			search_string << "#{term} like :search"
		end
		users = User.page(page).per_page(per_page)
		users = users.where(search_string.join(' or '), search: "%#{params[:search][:value]}%")
	end

	def columns
		%w(first_name last_name phone_number)
	end
end