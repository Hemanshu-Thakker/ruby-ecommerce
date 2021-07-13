require 'pry'
file_path = File.expand_path(File.dirname(__FILE__))
test_cases_1_file_name = "step1.rb"
test_cases_2_file_name = "step2.rb"
test_cases_3_file_name = "step3.rb"
if system("ls -l | grep #{test_cases_1_file_name}") && system("ls -l | grep #{test_cases_2_file_name}") && system("ls -l | grep #{test_cases_3_file_name}")
	puts "Step1"
	puts "==============================================================="
	system("ruby #{test_cases_1_file_name} #{file_path}")
	puts
	puts "Step2"
	puts "==============================================================="
	system("ruby #{test_cases_2_file_name} #{file_path}")
	puts
	puts "Step3"
	puts "==============================================================="
	system("ruby #{test_cases_3_file_name} #{file_path}")	
else
	p "Current directory: #{file_path}, Executable files not present due to some reason, maybe file path is wrong"
end