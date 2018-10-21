# Nexys4 Pin Assignments
############################
# On-board Slide Switches  #
############################
set_property PACKAGE_PIN J15 [get_ports input_num[0]]
set_property IOSTANDARD LVCMOS33 [get_ports input_num[0]]
set_property PACKAGE_PIN L16 [get_ports input_num[1]]
set_property IOSTANDARD LVCMOS33 [get_ports input_num[1]]
set_property PACKAGE_PIN M13 [get_ports input_num[2]]
set_property IOSTANDARD LVCMOS33 [get_ports input_num[2]]
set_property PACKAGE_PIN R15 [get_ports input_num[3]]
set_property IOSTANDARD LVCMOS33 [get_ports input_num[3]]
set_property PACKAGE_PIN R17 [get_ports input_num[4]]
set_property IOSTANDARD LVCMOS33 [get_ports input_num[4]]
############################
# On-board led             #
############################
set_property PACKAGE_PIN H17 [get_ports LED[0]]
set_property IOSTANDARD LVCMOS33 [get_ports LED[0]]
set_property PACKAGE_PIN K15 [get_ports LED[1]]
set_property IOSTANDARD LVCMOS33 [get_ports LED[1]]
set_property PACKAGE_PIN J13 [get_ports LED[2]]
set_property IOSTANDARD LVCMOS33 [get_ports LED[2]]
set_property PACKAGE_PIN N14 [get_ports LED[3]]
set_property IOSTANDARD LVCMOS33 [get_ports LED[3]]
set_property PACKAGE_PIN R18 [get_ports LED[4]]
set_property IOSTANDARD LVCMOS33 [get_ports LED[4]]
set_property PACKAGE_PIN V17 [get_ports LED[5]]
set_property IOSTANDARD LVCMOS33 [get_ports LED[5]]

## On-board display
set_property PACKAGE_PIN J17 [get_ports AN[0]]
set_property IOSTANDARD LVCMOS33 [get_ports AN[0]]
set_property PACKAGE_PIN J18 [get_ports AN[1]]
set_property IOSTANDARD LVCMOS33 [get_ports AN[1]]
set_property PACKAGE_PIN T9 [get_ports AN[2]]
set_property IOSTANDARD LVCMOS33 [get_ports AN[2]]
set_property PACKAGE_PIN J14 [get_ports AN[3]]
set_property IOSTANDARD LVCMOS33 [get_ports AN[3]]
set_property PACKAGE_PIN P14 [get_ports AN[4]]
set_property IOSTANDARD LVCMOS33 [get_ports AN[4]]
set_property PACKAGE_PIN T14 [get_ports AN[5]]
set_property IOSTANDARD LVCMOS33 [get_ports AN[5]]
set_property PACKAGE_PIN K2 [get_ports AN[6]]
set_property IOSTANDARD LVCMOS33 [get_ports AN[6]]
set_property PACKAGE_PIN U13 [get_ports AN[7]]
set_property IOSTANDARD LVCMOS33 [get_ports AN[7]]
## display
## CA, CB, CC, CD, CE, CF, CG, DP
set_property PACKAGE_PIN T10 [get_ports SEG[0]]
set_property IOSTANDARD LVCMOS33 [get_ports SEG[0]]
set_property PACKAGE_PIN R10 [get_ports SEG[1]]
set_property IOSTANDARD LVCMOS33 [get_ports SEG[1]]
set_property PACKAGE_PIN K16 [get_ports SEG[2]]
set_property IOSTANDARD LVCMOS33 [get_ports SEG[2]]
set_property PACKAGE_PIN K13 [get_ports SEG[3]]
set_property IOSTANDARD LVCMOS33 [get_ports SEG[3]]
set_property PACKAGE_PIN P15 [get_ports SEG[4]]
set_property IOSTANDARD LVCMOS33 [get_ports SEG[4]]
set_property PACKAGE_PIN T11 [get_ports SEG[5]]
set_property IOSTANDARD LVCMOS33 [get_ports SEG[5]]
set_property PACKAGE_PIN L18 [get_ports SEG[6]]
set_property IOSTANDARD LVCMOS33 [get_ports SEG[6]]
set_property PACKAGE_PIN H15 [get_ports SEG[7]]
set_property IOSTANDARD LVCMOS33 [get_ports SEG[7]]

# clock
set_property PACKAGE_PIN E3 [get_ports clock]
set_property IOSTANDARD LVCMOS33 [get_ports clock]
# power button
set_property PACKAGE_PIN P17 [get_ports power_btn]
set_property IOSTANDARD LVCMOS33 [get_ports power_btn]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets next_btn_IBUF]

set_property PACKAGE_PIN M17 [get_ports next_btn]
set_property IOSTANDARD LVCMOS33 [get_ports next_btn]
# power light
set_property PACKAGE_PIN R11 [get_ports green]
set_property IOSTANDARD LVCMOS33 [get_ports green]

set_property PACKAGE_PIN N16 [get_ports red]
set_property IOSTANDARD LVCMOS33 [get_ports red]

# state
set_property PACKAGE_PIN V11 [get_ports change]
set_property IOSTANDARD LVCMOS33 [get_ports change]

set_property PACKAGE_PIN V12 [get_ports check]
set_property IOSTANDARD LVCMOS33 [get_ports check]

set_property PACKAGE_PIN V14 [get_ports err]
set_property IOSTANDARD LVCMOS33 [get_ports err]

set_property PACKAGE_PIN M16 [get_ports next_on]
set_property IOSTANDARD LVCMOS33 [get_ports next_on]

set_property PACKAGE_PIN U17 [get_ports full]
set_property IOSTANDARD LVCMOS33 [get_ports full]