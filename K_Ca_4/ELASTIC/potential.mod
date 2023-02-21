# NOTE: This script can be modified for different pair styles 
# See in.elastic for more info.

# Choose potential
pair_style	reaxff control.reax
pair_coeff * * ffieldAS.reax H O Al Si K Ca

newton		on

compute reax all pair reaxff

variable eb	equal c_reax[1]
variable ea  	equal c_reax[2]
variable elp 	equal c_reax[3]
variable emol 	equal c_reax[4]
variable ev 	equal c_reax[5]
variable epen 	equal c_reax[6]
variable ecoa 	equal c_reax[7]
variable ehb 	equal c_reax[8]
variable et 	equal c_reax[9]
variable eco 	equal c_reax[10]
variable ew 	equal c_reax[11]
variable ep 	equal c_reax[12]
variable efi 	equal c_reax[13]
variable eqeq 	equal c_reax[14]

# Setup neighbor style
neigh_modify once no every 1 delay 0 check yes

fix 1 all qeq/reaxff 10 0.0 7.0 1.0e-6 reaxff

# Setup minimization style
min_style	     cg
min_modify	     dmax ${dmax} line quadratic

# Setup output
thermo		1
thermo_style custom step temp pe press pxx pyy pzz pxy pxz pyz lx ly lz vol
thermo_modify norm no