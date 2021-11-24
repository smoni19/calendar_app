feature "User can see calendar" do 
	scenario "Displays days and dates of every day for selected month and year" do
		visit("/")
		fill_in("month_input", with: 11)
		fill_in("year_input", with: 1990)
		click_button("Update")
		expect(page).to have_content('November 1990')
		expect(page).to have_content('Thursday 1st')
		expect(page).to have_content('Friday 30th')
		expect(page.status_code).to be 200
	end

	scenario "User can use button to display next month. If December, next month is January and year increments by 1" do
		visit("/")
		fill_in("month_input", with: 12)
		fill_in("year_input", with: 2021)
		click_button("Update")
		expect(page).to have_content('December 2021')
		click_button("next_month_button")
		expect(page).to have_content('January 2022')
		expect(page.status_code).to be 200
	end
end
