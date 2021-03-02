#!/bin/bash
#module purge
#module load gromacs/5.1/64

for i in {0..15..1}
do
	mkdir FEP_$i
	cp em_FEP_Tanadet.mdp FEP_"$i"/em_"$i"_FEP_Tanadet.mdp
	cp md_FEP.mdp FEP_"$i"/md_"$i"_FEP.mdp
	sed -i s/PATAMON/"$i"/g FEP_"$i"/em_"$i"_FEP_Tanadet.mdp
	gmx grompp -f FEP_"$i"/em_"$i"_FEP_Tanadet.mdp -c init.pdb -p topol.top -o FEP_"$i"/em_"$i".tpr -maxwarn 5 -n index.ndx
	gmx mdrun -deffnm FEP_"$i"/em_"$i" -v
	echo "finish em run $i" 
		done
		
