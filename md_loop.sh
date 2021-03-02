#!/bin/bash
#module purge
#module load gromacs/2018-SSE
mkdir md_axon
for i in {0..15}
do
	rm FEP_"$i"/md_"$i"_FEP_Tanadet.mdp
	cp md_FEP.mdp FEP_"$i"/md_"$i"_FEP_Tanadet.mdp
	sed -i s/PATAMON/"$i"/g FEP_"$i"/md_"$i"_FEP_Tanadet.mdp
        mkdir md_axon/FEP{1..10}_"$i"
	gmx grompp -f FEP_"$i"/md_"$i"_FEP_Tanadet.mdp -c FEP_"$i"/em_"$i".gro -p topol.top -o md_axon/FEP1_"$i"/md_"$i".tpr -maxwarn 5 -n index.ndx
	gmx grompp -f FEP_"$i"/md_"$i"_FEP_Tanadet.mdp -c FEP_"$i"/em_"$i".gro -p topol.top -o md_axon/FEP2_"$i"/md_"$i".tpr -maxwarn 5 -n index.ndx
	gmx grompp -f FEP_"$i"/md_"$i"_FEP_Tanadet.mdp -c FEP_"$i"/em_"$i".gro -p topol.top -o md_axon/FEP3_"$i"/md_"$i".tpr -maxwarn 5 -n index.ndx
        gmx grompp -f FEP_"$i"/md_"$i"_FEP_Tanadet.mdp -c FEP_"$i"/em_"$i".gro -p topol.top -o md_axon/FEP4_"$i"/md_"$i".tpr -maxwarn 5 -n index.ndx
        gmx grompp -f FEP_"$i"/md_"$i"_FEP_Tanadet.mdp -c FEP_"$i"/em_"$i".gro -p topol.top -o md_axon/FEP5_"$i"/md_"$i".tpr -maxwarn 5 -n index.ndx
        gmx grompp -f FEP_"$i"/md_"$i"_FEP_Tanadet.mdp -c FEP_"$i"/em_"$i".gro -p topol.top -o md_axon/FEP6_"$i"/md_"$i".tpr -maxwarn 5 -n index.ndx
        gmx grompp -f FEP_"$i"/md_"$i"_FEP_Tanadet.mdp -c FEP_"$i"/em_"$i".gro -p topol.top -o md_axon/FEP7_"$i"/md_"$i".tpr -maxwarn 5 -n index.ndx
        gmx grompp -f FEP_"$i"/md_"$i"_FEP_Tanadet.mdp -c FEP_"$i"/em_"$i".gro -p topol.top -o md_axon/FEP8_"$i"/md_"$i".tpr -maxwarn 5 -n index.ndx
        gmx grompp -f FEP_"$i"/md_"$i"_FEP_Tanadet.mdp -c FEP_"$i"/em_"$i".gro -p topol.top -o md_axon/FEP9_"$i"/md_"$i".tpr -maxwarn 5 -n index.ndx
        gmx grompp -f FEP_"$i"/md_"$i"_FEP_Tanadet.mdp -c FEP_"$i"/em_"$i".gro -p topol.top -o md_axon/FEP10_"$i"/md_"$i".tpr -maxwarn 5 -n index.ndx

	#	gmx_avx mdrun -deffnm FEP_"$i"/md_"$i" -v -nt 11
#	echo "finish em run $i"
		done
