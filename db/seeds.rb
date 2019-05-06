t_shirts = Category.find_or_create_by(name: 'T-shirts')
hoodies = Category.find_or_create_by(name: 'Hoodies')

gildan_hoodie = Style.find_or_create_by(name: 'Gildan Hoodie')
gildan_tee = Style.find_or_create_by(name: 'Gildan Tee')
champion_hoodie = Style.find_or_create_by(name: 'Champion Hoodie')

front_print = PrintLocation.find_or_create_by(name: 'Front')
back_print = PrintLocation.find_or_create_by(name: 'Back')
left_sleeve_upper_print = PrintLocation.find_or_create_by(name: 'Left Sleeve (Upper)')
right_sleeve_upper_print = PrintLocation.find_or_create_by(name: 'Right Sleeve (Upper)')
