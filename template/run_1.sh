#!/bin/sh

./branch_mispred 0 0 0 0 > output_1.txt
./branch_mispred 0.562341325 0.562341325 0.562341325 0.562341325 >> output_1.txt
./branch_mispred 0.668740305 0.668740305 0.668740305 0.668740305 >> output_1.txt
./branch_mispred 0.740082804 0.740082804 0.740082804 0.740082804 >> output_1.txt
./branch_mispred 0.795270729 0.795270729 0.795270729 0.795270729 >> output_1.txt
./branch_mispred 0.840896415 0.840896415 0.840896415 0.840896415 >> output_1.txt
./branch_mispred 0.880111737 0.880111737 0.880111737 0.880111737 >> output_1.txt
./branch_mispred 0.914691219 0.914691219 0.914691219 0.914691219 >> output_1.txt
./branch_mispred 0.945741609 0.945741609 0.945741609 0.945741609 >> output_1.txt
./branch_mispred 0.974003746 0.974003746 0.974003746 0.974003746 >> output_1.txt
./branch_mispred 1 1 1 1 >> output_1.txt

./getCPUCycles.sh output_1.txt > CPUCycles_1.txt
