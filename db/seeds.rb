# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

=begin
if User.count == 0
  puts "Creating an Admin/Manager User"
  if User.find_or_create_by_username(:username => 'jigar',
                                  :hashed_password => 'shah',
                                  :user_type => 'Manager', #Manager/Customer
                                  :firstname => 'Jigar',
                                  :lastname => 'Shah',
                                  :gender => 'Male',
                                  :bday_day => 1,
                                  :bday_month => 1,
                                  :bday_year => 1983,
                                  :s_addr_str_no => 4064,
                                  :s_addr_str_name => 'Rivermark Parkwy',
                                  :s_addr_city => 'Santa Clara',
                                  :s_addr_state => 'California',
                                  :s_addr_zip => 95054,
                                  :b_addr_str_no => 4064,
                                  :b_addr_str_name => 'Rivermark Parkwy',
                                  :b_addr_city => 'Santa Clara',
                                  :b_addr_state => 'California',
                                  :b_addr_zip => 95054,
                                  :email => 'jigarksh@gmail.com')
    puts "Success"
  else
    puts "Failure"
  end
end
=end

#Desktop
Product.create(:name => 'Desktop 1',:description => 'IBM',:quantity => 100,:price => 899,:category => 'Computer',:related_type => 'Office',:old_new => 'New',:image_url => 'desktop_1.jpg')
Product.create(:name => 'Desktop 2',:description => 'HP',:quantity => 100,:price => 899,:category => 'Computer',:related_type => 'Office',:old_new => 'New',:image_url => 'desktop_2.jpg')
Product.create(:name => 'Desktop 3',:description => 'Dell',:quantity => 100,:price => 899,:category => 'Computer',:related_type => 'Office',:old_new => 'New',:image_url => 'desktop_3.jpg')
Product.create(:name => 'Desktop 4',:description => 'Dell',:quantity => 100,:price => 899,:category => 'Computer',:related_type => 'Office',:old_new => 'New',:image_url => 'desktop_4.gif')
Product.create(:name => 'Desktop 5',:description => 'Apple',:quantity => 100,:price => 899, :category => 'Computer',:related_type => 'Office',:old_new => 'New',:image_url => 'desktop_5.gif')
Product.create(:name => 'Desktop 6',:description => 'Apple',:quantity => 100,:price => 899, :category => 'Computer',:related_type => 'Office',:old_new => 'New',:image_url => 'desktop_6.gif')

#Accessories
Product.create(:name => 'CD DVD Wallet',:description => 'Stores up to 100 CDs/DVDs',:quantity => 100,:price => 20,:category => 'Accessories',:related_type => 'Office',:old_new => 'New',:image_url => 'cd_dvd_wallet.gif')
Product.create(:name => 'DVD Media',:description => 'Very Good',:quantity => 100,:price => 899,:category => 'Accessories',:related_type => 'Office',:old_new => 'New',:image_url => 'dvd_media.jpg')
Product.create(:name => 'DVD Writer',:description => 'Blah Blah',:quantity => 100,:price => 899,:category => 'Accessories',:related_type => 'Office',:old_new => 'New',:image_url => 'dvd_writer.jpg')
Product.create(:name => 'Ext Floppy Drive',:description => 'Blah Blah',:quantity => 100,:price => 899,:category => 'Accessories',:related_type => 'Office',:old_new => 'New',:image_url => 'external_floppy_drive.jpg')
Product.create(:name => 'Flash Drive',:description => 'Blah Blah',:quantity => 100,:price => 899,:category => 'Accessories',:related_type => 'Office',:old_new => 'New',:image_url => 'flash_drive.jpg')
Product.create(:name => 'Hard Drive',:description => 'Blah Blah',:quantity => 100,:price => 899,:category => 'Accessories',:related_type => 'Office',:old_new => 'New',:image_url => 'hard_drive.jpg')
Product.create(:name => 'Wireless Headphone',:description => 'Blah Blah',:quantity => 100,:price => 899,:category => 'Accessories',:related_type => 'Office',:old_new => 'New',:image_url => 'headphone_wireless.jpg')
Product.create(:name => 'Wireless Keyboard',:description => 'Blah Blah',:quantity => 100,:price => 899,:category => 'Accessories',:related_type => 'Office',:old_new => 'New',:image_url => 'keyboard_wireless.jpg')
Product.create(:name => 'Wireless Mouse',:description => 'Blah Blah',:quantity => 100,:price => 899,:category => 'Accessories',:related_type => 'Office',:old_new => 'New',:image_url => 'mouse_wireless.jpg')
Product.create(:name => 'Wireless Router',:description => 'Blah Blah',:quantity => 100,:price => 899,:category => 'Accessories',:related_type => 'Office',:old_new => 'New',:image_url => 'router_wireless.jpg')
Product.create(:name => 'Laptop Case',:description => 'Blah Blah',:quantity => 100,:price => 899,:category => 'Accessories',:related_type => 'Office',:old_new => 'New',:image_url => 'laptop_case.gif')
Product.create(:name => 'Photo Printer',:description => 'Blah Blah',:quantity => 100,:price => 899,:category => 'Accessories',:related_type => 'Office',:old_new => 'New',:image_url => 'photo_printer.jpg')
Product.create(:name => 'Printer',:description => 'Blah Blah',:quantity => 100,:price => 899,:category => 'Accessories',:related_type => 'Office',:old_new => 'New',:image_url => 'printer.jpg')

#Mobile
Product.create(:name => 'Mobile 1',:description => 'Blah Blah',:quantity => 100,:price => 899,:category => 'Mobile',:related_type => 'Office',:old_new => 'New',:image_url => 'mobile_1.jpg')
Product.create(:name => 'Mobile 2',:description => 'Blah Blah',:quantity => 100,:price => 899,:category => 'Mobile',:related_type => 'Office',:old_new => 'New',:image_url => 'mobile_2.jpg')
Product.create(:name => 'Mobile 3',:description => 'Blah Blah',:quantity => 100,:price => 899,:category => 'Mobile',:related_type => 'Office',:old_new => 'New',:image_url => 'mobile_3.jpg')

#MP3 Player
Product.create(:name => 'MP3 Player 1',:description => 'Very good MP3 Player 1',:quantity => 100,:price => 899,:category => 'MP3 Player',:related_type => 'Office',:old_new => 'New',:image_url => 'mp3_player_1.jpg')
Product.create(:name => 'MP3 Player 2',:description => 'Very good MP3 Player 2',:quantity => 100,:price => 899,:category => 'MP3 Player',:related_type => 'Office',:old_new => 'New',:image_url => 'mp3_player_2.jpg')
Product.create(:name => 'MP3 Player 3',:description => 'Very good MP3 Player 3',:quantity => 100,:price => 899,:category => 'MP3 Player',:related_type => 'Office',:old_new => 'New',:image_url => 'mp3_player_3.jpg')

#Notepad
Product.create(:name => 'Notepad 1',:description => 'Notepad 1',:quantity => 100,:price => 899,:category => 'Computer',:related_type => 'Office',:old_new => 'New',:image_url => 'notebook_1.jpg')
Product.create(:name => 'Notepad 2',:description => 'Notepad 2',:quantity => 100,:price => 899,:category => 'Computer',:related_type => 'Office',:old_new => 'New',:image_url => 'notebook_2.jpg')
Product.create(:name => 'Notepad 3',:description => 'Notepad 3',:quantity => 100,:price => 899,:category => 'Computer',:related_type => 'Office',:old_new => 'New',:image_url => 'notebook_3.jpg')
Product.create(:name => 'Notepad 4',:description => 'Notepad 4',:quantity => 100,:price => 899,:category => 'Computer',:related_type => 'Office',:old_new => 'New',:image_url => 'notebook_4.jpg')
Product.create(:name => 'Notepad 5',:description => 'Notepad 5',:quantity => 100,:price => 899,:category => 'Computer',:related_type => 'Office',:old_new => 'New',:image_url => 'notebook_5.jpg')
Product.create(:name => 'Notepad 6',:description => 'Notepad 6',:quantity => 100,:price => 899,:category => 'Computer',:related_type => 'Office',:old_new => 'New',:image_url => 'notebook_6.jpg')
Product.create(:name => 'Notepad 7',:description => 'Notepad 7',:quantity => 100,:price => 899,:category => 'Computer',:related_type => 'Office',:old_new => 'New',:image_url => 'notebook_7.jpg')

#Software
Product.create(:name => 'S/w Accounting',:description => 'Accounting S/w',:quantity => 100,:price => 899,:category => 'Software',:related_type => 'Office',:old_new => 'New',:image_url => 'sw_accounting.jpg')
Product.create(:name => 'S/w McAfee',:description => 'McAfee S/w',:quantity => 100,:price => 899,:category => 'Software',:related_type => 'Office',:old_new => 'New',:image_url => 'sw_mcafee.jpg')
Product.create(:name => 'S/w Media Creator',:description => 'Media Creator S/w',:quantity => 100,:price => 899,:category => 'Software',:related_type => 'Office',:old_new => 'New',:image_url => 'sw_media_creator.jpg')
Product.create(:name => 'S/w Quickcare',:description => 'Quickcare S/w',:quantity => 100,:price => 899,:category => 'Software',:related_type => 'Office',:old_new => 'New',:image_url => 'sw_quickcare.jpg')
Product.create(:name => 'S/w VCome',:description => 'VCome S/w',:quantity => 100,:price => 899,:category => 'Software',:related_type => 'Office',:old_new => 'New',:image_url => 'sw_vcom_systemsuite_6.jpg')
Product.create(:name => 'S/w Zone Alarm',:description => 'Zone Alarm S/w',:quantity => 100,:price => 899,:category => 'Software',:related_type => 'Office',:old_new => 'New',:image_url => 'sw_zone_alarm.jpg')
