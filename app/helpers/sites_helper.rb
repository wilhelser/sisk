module SitesHelper
  def entertainment_categories
    [
      ['Dining', 25],
      ['Shopping', 27],
      ['Travel', 91],
      ['Attractions', 26],
      ['Services', 485],
      ['Movies', 471],
      ['Online Deals', 160]
    ]
  end

  def dining_subcategories
    [
      ['Fast Food', 38],
      ['Casual Dining', 39],
      ['Fine Dining', 42]
    ]
  end

  def cuisine_subcategories
    [
      [ 'African', 193],
      [ 'American', 168 ],
      [ 'Asian', 182 ],
      [ 'Cajun/Creole', 184 ],
      [ 'Canadian', 185 ],
      [ 'Caribbean', 190 ],
      [ 'European', 180 ],
      [ 'Indian', 176 ],
      [ 'Italian', 170 ],
      [ 'Kosher', 189 ],
      [ 'Mexican', 171 ],
      [ 'Middle Eastern', 178 ],
      [ 'South American', 197 ],
      [ 'Vegetarian', 194 ]
    ]
  end

  def entertainment_distances
    [
      ['5', 5],
      ['10', 10],
      ['15', 15],
      ['25', 25],
      ['50', 50],
      ['75', 75],
      ['100', 100]
    ]
  end
end
