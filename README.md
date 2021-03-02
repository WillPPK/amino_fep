# amino_fep
This is a collection of files which I used for my previous FEP calculation. A lot of optimisation...

Amino acids CG-FEP guide/tutorial

 

You will need:

1. mdp file (see attachments). This will have an additional column on vdw/coulombic perturbation
2. protein itp file with an additional alchemical transformation column (see below)
3. A ligand bound structure system (bottom left)
4. A ligand free structure system (top left)
5. A bash script indicating a pipeline
6. Topology file (as per usual)
7. index file (as per usual)
8. A modified forcefield.

Note:

Mdp files


You have this block on perturbation. In this case, we used 15 λ windows where coulombic term is perturbed from state A to B in the first 10 window and the VDW is perturbed in the last 10 windows. There are some overlap and this should work.
You will see what “PATAMON” means later - if you google the word, you should see a Digimon pops up.  
Protein itp file

 

You will need to perturb your amino acid side chain in your protein-cg.itp file. So, you need to know which side chain are you working with. In this case, I perturbed lysine to asparagine. A CG-parameter for each amino acid should be available on the martini website.

Note - it is much easier to LOSE a bead than a gain a bead. Always think of what you are transforming your system to. If you want to do E → R. Maybe it is easier to have a whole system with R, then transform to E, and invert the sign etc.

If you lose a bead, you will need to transform it to Dum, a dummy particle. This particle has 0 interactions with other cg particle as it is defined in the martini_2.2_dum.itp

Particle definition
 
Cross-term interaction
 
Same term interaction
 
If you perturb charge, you will need to perturb your counter ions as well.

I tend to stick this at a bottom of the martini_v2.2_dum file. It’s the same particle, just now with no charge. You can have it as NAP or CLP depending on the charge you perturb - just make sure it adds up to zero.

 
Bash script

Now this is the boring bits…


I wrote a for loop for this bash script, basically - what it means is that you have to run simulation on each window - there are 16 windows. My suggestion is to do this on a separate folder. In each folder, it will read its own lambda window - the lambda window is written as PATAMON.

In this script, I will replace with word “PATAMON” with my window - i.e. 0, 1, 2, 3…..14, 15. See sed line.

Then - my pipeline will grompp the whole thing. And run em for me. This will automatically repeat its action for every windows. So basically this will run 16 times.

 

Then - for a production run. I set up another stupid script. I should have done a double for loop but meh. Why bother when you can copy paste 15 times for a good healthy 15 repeats.

I strongly recommend a naming system of FEP”$i”_”j” where i is your number of repeat and j is your λ window.

Then you should run this on JADE or local resources, or your workstation. Each window is super duper fast (10 mins max). It’s just that there is 16x15 = 240 simulations as each will be 12 ns where we discard the first 2ns.

My top tip will be:

1) Have a folder for a bound config. And a free config. 
2) Make sure that both config has the same protein-cg.itp file.

Good luck!



